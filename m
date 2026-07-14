Return-Path: <linux-arm-msm+bounces-119083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Nq67G2NvVmrs5QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 19:18:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 818B17574BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 19:18:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=olQ+i3p5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=axDT57nn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119083-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119083-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C8D7D3018310
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 17:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25DF134F27B;
	Tue, 14 Jul 2026 17:18:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5F330674D
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:17:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784049481; cv=none; b=eiQZg0TicMvY4YuASDJbA48lET9JBPBnozBcQst/6m560Y94T5MQ8TJCOI3WAbTBxNf4v/dv5rhD9dUcnup70Lbi8eMxx/z1TZVHrx1hw33mpd9D8gyILRR3LH4p3I0hSrEhq0qAKjliwNP6Ivy5PEEu3KZ7cRzvhFtZzPq3jMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784049481; c=relaxed/simple;
	bh=2g/1r+tUGIrYD+Rpn7qaYdeF3w/p959uoI3764ZH9S4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JySCNl2h2QWa3LyY6sgb5B4LpFOk3yONbA4auWy1/VGy0XgKMSrcJ+mcd+bdpaRUUnTRlctjVUUpDL5erdFKCkJlV/EJyuy9UcUgpIEqdUiAhfGGPfTpD649cUSI/LthEE26QTVcixYC6ZQP2DG0iEVhrumV4m+uJJY/wiJAUmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=olQ+i3p5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=axDT57nn; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG75aq1091333
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ja824+WEhomskfYCkM3rLk2MZr0em1PMkZk1CkEWLQ=; b=olQ+i3p51ODhRg2X
	0dXQ8vmRFQzbniW44oE8+jTuBdtnwuoauiYcPYGzI3xg2eohPZxsPYbPBHeiaZVR
	4vk/kp2oX9xy1uimqdzfN4z0ixDc1Hb8M/PbayfvX5vU4C3pv4HUsOREEuoUCh8V
	kw4EU2iwgqemCvbUl3blD0EUqSjed2l9iWces0GFO4GKI9ZHpP68e4pJwFpeM4u8
	+tQQ3S7F2y9lyNR+x++fOL2o2y8XwzemH4MCGqtiG3A60VkVkoxWo7XrrqDf7Tbu
	yxfZhRjWmQrMzSl93n9Tm8VISd5AwrAfKv4g0a2RjJyFSR0TQwjwMT7qkPNa43uY
	vWR9Pw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdgudjatr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:17:57 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8486c3411c8so6485914b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 10:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049476; x=1784654276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ja824+WEhomskfYCkM3rLk2MZr0em1PMkZk1CkEWLQ=;
        b=axDT57nn/EuP0qvB4p7BUM0SEz+IwK7gvSagKFzNSWu/R8PB/hyKO0WMMAoOgDoPLZ
         Ldadq4MmhVytxVDfgdbXOfox4XNEBnHb4NZpdy9m21ZV3TiFHly7vVc+36Wcy6TeCr8a
         u2UJCi28kI2HIwruwnItR0FOGKrMU/L3Pf5Rcn0bxsCI3rHlPD7lgALde8BhaQ3XTard
         YrQxizaVnC+sIRIux1aqArCb3zPJcWOWVR0bzE2dyN2brcibCDzcN97naJcUbfpfGxAf
         fFPQUv9HK/wTDxk0AP8rAvvhQ32MU1JQqX41cRxUt3eqK9sscC7gE5njjTvLgjahzcez
         Qfyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049476; x=1784654276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ja824+WEhomskfYCkM3rLk2MZr0em1PMkZk1CkEWLQ=;
        b=KR/Gtll+uguvLFLGwRCc539rpjsYJcxblb9+krDOdc+BkAi2r3aLQ4+j7MQ1Pm4JPG
         ZLz4PfcUKDcaaACDnuQSUDw+aUhbZbywbApRDUEgIwKjqshPintiwJnwa9HdY5C/f/mE
         k+TMJ3FDjL846l6GLQ5KDIReSyiyP61uQrs9q3/sE/EHxuI560C2RKyGCcxxbHLYbIAq
         mxyH8k4NADPKyW0XGZ6MtdHIa9j/agu5ENVDvustfiCHxfc4vtn1+bQrGYIKaZG0dVfe
         7+MasmV9WoCUDCRUuRPZ/RG2WFZJfvkfopQKZaSbz4hxq0iz3ntyh5gqEU/UnrrVuaDP
         zfeQ==
X-Forwarded-Encrypted: i=1; AHgh+RrMbzzw/2f51cPueLkn32sbu2k8xe4rpUCcWDMze4uf6xY8DjM/0fRmNHDidNO4fZEiTIbkZihDAsgGP2nA@vger.kernel.org
X-Gm-Message-State: AOJu0YwFa7U0jH/6t12JbXhaXwBNl7TyQ7VuOETkR5rnW1TW7ArXldIg
	fXS+l7Jv2RF/zwBj2Lv294U3ON8RZKOPs03+FUWXGawky77RHLUCOeIJHcy5Fo09OL0CEiXiO4O
	gkibVzqfq3BM6QzaSA/YlWS5LBWmgSIeyokkdX5MvL0NhDYe8XWAOJ/75K8ui/utmpPbl
X-Gm-Gg: AfdE7ckZEf8djyOO8JNsTa+fW1JNjetyNzrIYjhn6J5Ts96CPf33i3cFGP3Pw8k26J0
	cUqKgCJYmZwqO3dK4wqfmdYL0MCv0LhswNjoSBhTwKg4FExjXvJR5GlRd0EBMFh+5SGowjPURw2
	O9fSiuh5gI49zLiIcQCU7rFT3AGx6SWSlWcIFDppL6UsEq5qBv2gYd2N5Rx5teHbg9dEfdH3YAK
	3dh4Dn58dKJsLRAt9cDQKIMZ55EVkr7b0MlKtXLnNG6TWsZMpihMv617paSCpuhMS3rMAZq/yRE
	ZLZM+yFgLDATEyjua9JTqT3X63hn7J4bNFAkWlM+h/tzF5EkuRv995fgVd3YanOvEbe8OvOTO1r
	8iO5tDkBiQNUfdV2M6Mnz5taHGxxQDNRAPeNeC8oynUhP7AM=
X-Received: by 2002:a05:6a00:18a0:b0:847:8387:e32a with SMTP id d2e1a72fcca58-848896ddd25mr12586615b3a.46.1784049476109;
        Tue, 14 Jul 2026 10:17:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:18a0:b0:847:8387:e32a with SMTP id d2e1a72fcca58-848896ddd25mr12586579b3a.46.1784049475558;
        Tue, 14 Jul 2026 10:17:55 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:17:55 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:35 +0530
Subject: [PATCH v23 07/13] power: reset: Add psci-reboot-mode driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-7-e7453c548c21@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=5437;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=2g/1r+tUGIrYD+Rpn7qaYdeF3w/p959uoI3764ZH9S4=;
 b=RmGqrG14uHOhF9BDsVH78VIuj42ggnKscphUOnOD+Gsmj+ocFk015pzZWMOf1ClDpSeh6qKxr
 o9Kk+eX4kGJC5I1S6kHDTRVsTWq5oA0b2e42D470B9lnOFzbRc1I0zn
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: 8kaR-9O69XpdlxI53MTtzZk4Bxjx0chQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX/Zu1IWVv4NNX
 HeEXCF9Z+b0vT7BoCi9zVt29IbIuUPVXYs+GRflloq1MB6pG77nG6ikLD9nK0nhzO63wUrSwXPI
 /dFkKmJ2zZz+O3fRun3kwaeE27tRJnIJSkR7tazZPH+fCOqLnHQ5b5kFI3cv2nMyF8eQ3CkawGJ
 cK6d9i89q04T/GOaPm77zKNYt1PKqIyouXkUNId01Q2hQTHiMApZVyobidnOPqStlsMeXEWMDHs
 KUr8HrDpHZD3Jf9KQtvx3bBMRe99g8EIwkncHa7HkTe2GUcnPTRXYDorPJbaxQQwXd250i1fCFS
 p5bSTk8KHj2OZIq6p2zQfjNH4HuutboMr1S930RcydnADK//Euou3xQw1hLdraw+OmuHq1TAtkB
 kP3XVqkLDmLOH+q8dBEHI1F9rTquwhyzI2ldf3UHz/0Xc2tASKLZUlpucCMXSyptvaCmrykHeoD
 fldh9xPs3FEB/GFTwPA==
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a566f45 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=5CqnhzuZLWPXzHx0y-cA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX+tYROG1+/5Pl
 13PfCTQr9HFslf8jGVnQ4C4DakkV5yXl1tgyz9fElZ1pyfhX/Rt9NeptPzg6WwYIH3uzBM6+CCk
 9W1zJk5hcFC0CqtnYX9D0JjjA2uLf2M=
X-Proofpoint-ORIG-GUID: 8kaR-9O69XpdlxI53MTtzZk4Bxjx0chQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1011 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140178
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-119083-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_RECIPIENTS(0.00)[m:sre@kernel.org,m:mark.rutland@arm.com,m:lpieralisi@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:christian.loehle@arm.com,m:ulfh@kernel.org,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:arnd@arndb.de,m:Souvik.Chakravarty@arm.com,m:andy.yan@rock-chips.com,m:matthias.bgg@gmail.com,m:john.stultz@linaro.org,m:moritz.fischer@ettus.com,m:brgl@kernel.org,m:sudeep.holla@kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:shivendra.pratap@oss.qualcomm.com,m:florian.fainelli@broadcom.com,m:krzk@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:andre.draszik@linaro.org,m:gregkh@linuxfoundation.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:mfd@lists.linux.dev,m:srini@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:li
 sts@lfdr.de];
	FORGED_SENDER(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: 818B17574BB

PSCI supports different types of resets like SYSTEM_RESET, SYSTEM_RESET2
ARCH WARM reset and SYSTEM_RESET2 vendor-specific resets. Currently
there is no common driver that handles all supported psci resets at one
place. Additionally, there is no common mechanism to issue the supported
psci resets from userspace.

Add a psci-reboot-mode driver, and define two types of PSCI resets,
predefined-resets and vendor-specific resets. Predefined-resets are
defined by psci driver and vendor-specific resets are defined by SoC
vendors, under the psci:reboot-mode node of SoC device tree.

Register the driver with the reboot-mode framework to interface these
resets to userspace. When userspace initiates a supported command, pass
the reset arguments to the PSCI driver to enable command-based reset.

This change allows userspace to issue supported PSCI reset commands
using the standard reboot system calls while enabling SoC vendors to
define their specific resets for PSCI.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 MAINTAINERS                            |  1 +
 drivers/power/reset/Kconfig            | 10 +++++
 drivers/power/reset/Makefile           |  1 +
 drivers/power/reset/psci-reboot-mode.c | 78 ++++++++++++++++++++++++++++++++++
 4 files changed, 90 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e1ed6abef62a..4910abafa170 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21576,6 +21576,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/arm/psci.yaml
 F:	drivers/firmware/psci/
 F:	drivers/mfd/psci-mfd.c
+F:	drivers/power/reset/psci-reboot-mode.c
 F:	include/linux/psci.h
 F:	include/uapi/linux/psci.h
 
diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index 124afb99febe..93e4029d9506 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -348,6 +348,16 @@ config NVMEM_REBOOT_MODE
 	  then the bootloader can read it and take different
 	  action according to the mode.
 
+config PSCI_REBOOT_MODE
+	bool "PSCI reboot mode driver"
+	depends on OF && (ARM_PSCI_FW || COMPILE_TEST)
+	select REBOOT_MODE
+	help
+	  Say y here will enable PSCI reboot mode driver. This gets
+	  the PSCI reboot mode arguments and passes them to psci
+	  driver. psci driver uses these arguments for issuing
+	  device reset into different boot states.
+
 config POWER_MLXBF
 	tristate "Mellanox BlueField power handling driver"
 	depends on (GPIO_MLXBF2 || GPIO_MLXBF3) && ACPI
diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
index d7ae97241a83..02948622fe3d 100644
--- a/drivers/power/reset/Makefile
+++ b/drivers/power/reset/Makefile
@@ -40,5 +40,6 @@ obj-$(CONFIG_REBOOT_MODE) += reboot-mode.o
 obj-$(CONFIG_SYSCON_REBOOT_MODE) += syscon-reboot-mode.o
 obj-$(CONFIG_POWER_RESET_SC27XX) += sc27xx-poweroff.o
 obj-$(CONFIG_NVMEM_REBOOT_MODE) += nvmem-reboot-mode.o
+obj-$(CONFIG_PSCI_REBOOT_MODE) += psci-reboot-mode.o
 obj-$(CONFIG_POWER_MLXBF) += pwr-mlxbf.o
 obj-$(CONFIG_POWER_RESET_QEMU_VIRT_CTRL) += qemu-virt-ctrl.o
diff --git a/drivers/power/reset/psci-reboot-mode.c b/drivers/power/reset/psci-reboot-mode.c
new file mode 100644
index 000000000000..955ed68f1402
--- /dev/null
+++ b/drivers/power/reset/psci-reboot-mode.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/array_size.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/psci.h>
+#include <linux/reboot-mode.h>
+#include <linux/types.h>
+
+static const struct reboot_mode_entry psci_resets[] = {
+	{
+		.name  = "psci-system-reset",
+		.magic = { 0, PSCI_SYSTEM_RESET_COLD_RESET },
+		.count = 2,
+	},
+	{
+		.name  = "psci-system-reset2-arch-warm-reset",
+		.magic = { 0, PSCI_SYSTEM_RESET2_ARCH_WARM_RESET },
+		.count = 2,
+	},
+};
+
+static u64 psci_reboot_mode_get_cookie(const u32 *magic, int count)
+{
+	u64 cookie = 0;
+	int i;
+
+	/* Build cookie from arg2/arg3 cells in order: cookie_hi then cookie_lo. */
+	for (i = 1; i < count; i++)
+		cookie = (cookie << 32) | magic[i];
+
+	return cookie;
+}
+
+static int psci_reboot_mode_write(struct reboot_mode_driver *reboot,
+				  u32 *magic, int count)
+{
+	if (count < 1 || count > 3)
+		return -EINVAL;
+
+	return psci_set_reset_cmd(magic[0], psci_reboot_mode_get_cookie(magic, count));
+}
+
+static int psci_reboot_mode_probe(struct platform_device *pdev)
+{
+	struct reboot_mode_driver *reboot;
+	size_t count;
+	int ret;
+
+	reboot = devm_kzalloc(&pdev->dev, sizeof(*reboot), GFP_KERNEL);
+	if (!reboot)
+		return -ENOMEM;
+
+	reboot_mode_driver_init(reboot, &pdev->dev, psci_reboot_mode_write);
+
+	/* Skip PSCI SYSTEM_RESET2 modes if unsupported */
+	count = psci_has_system_reset2_support() ? ARRAY_SIZE(psci_resets) : 1;
+	ret = reboot_mode_add_predefined_modes(reboot, psci_resets, count);
+	if (ret)
+		return ret;
+
+	return devm_reboot_mode_register(&pdev->dev, reboot);
+}
+
+static struct platform_driver psci_reboot_mode_driver = {
+	.probe  = psci_reboot_mode_probe,
+	.driver = {
+		.name	= "psci-reboot-mode",
+	},
+};
+module_platform_driver(psci_reboot_mode_driver);
+
+MODULE_DESCRIPTION("PSCI reboot mode driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


