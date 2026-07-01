Return-Path: <linux-arm-msm+bounces-115743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Lq2GJnQ8RWo/9AoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:12:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6AA6EF938
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:12:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eLRgeEjC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bClEbZ+g;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115743-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115743-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A2DFE30620A6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 16:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88AD04963DD;
	Wed,  1 Jul 2026 16:00:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C2F494A08
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 16:00:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782921643; cv=none; b=jCAXkRmDAZ2TWGu2w/h0SHfw0gO+Xp3LO1TbidxL2U76NBTMQwu2iInZp65MdnEekvZXaBHoGhRViOaEkoIy4EfgUHwEhHMs0RfdH3azM2yJ+aXw9TWNCdZkgv4MCPP9fVq8kJKIsWIytpfxgYBEs7QvNFs2wCwlQu5HJCD1024=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782921643; c=relaxed/simple;
	bh=NJn2c31lUH7/D4D288VRl32/NWMVhF4Gt9cu63zJMps=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=taDpxvNBMNC/FY7AuVXzAJ+ia9TICN4WfJj9mcte1Z+/aS7RN93gc/sAEkut6s5xHB5C/8hZkd+JW1pPyCK8jS0YTZSK8kPDi0+jgo1iRFh8PXbVqYOfHBp25VEM4+Ed1usfOk8ct8g0eJgdm2uu8sksSshDOHpZuLIbAgPxpME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eLRgeEjC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bClEbZ+g; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661FoNuW1532893
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 16:00:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=h6kqBe/1HqC093rRFcLnOq
	y3nv640MGtvfx3ayZFRYw=; b=eLRgeEjCy31rzy9tZarhmF5RzLaGbFh22koYq8
	lnRDUX7UJO8DMuxeaspcWJObEChEuWWBXlCZmcMHWa3r3L7BnTnVkXbN/+3dcej5
	TOqAFnF5ZayUzTxPDjCspYi1ZFjqCx56CCYyPc4PgZCcwnYhx4VPE7bd8ZmvlV5F
	zX8jYx6CzMWPsLM5JytL7MLbAz0LiIdNcCJ41t3x3d4SU5sNKUe4ISRQuyNjm2o+
	oTgWOf0ItSsdXQeWJClRR+1ANT5kKplRAO48ogqA7kHL8pQqHvclLBjj8V113eJu
	+URP6/d/0sdAvLIq07glcUNxxfYuCzoxayTai3hvkC2AuiBg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4x0tjcbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 16:00:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915d3261c5cso82198685a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 09:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782921633; x=1783526433; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h6kqBe/1HqC093rRFcLnOqy3nv640MGtvfx3ayZFRYw=;
        b=bClEbZ+gYM8EzydDuMAM3hfEfjWDe24hae76bctVQC/sM+BF5w/3ldjhXJNXLSY1sw
         6+tHcDjjN4p2MDpFcfWXuupn/izKtv1ysVG02KK7C5A2W2BGiuibT+ilNN4FiwiYF2Cd
         L/RgKL5wnpiWBmmMGn7kvKxcSRZ7zWjgRUOuQHSMX1gwEtfdBsex5Q4E62ErPJ363XbQ
         zn9Mm+bgwNZOVKVf2sqGO72yp7FBcGKMbQO4YDJDz2X+D7IZGMTMosWjcFLX0ORq3EOQ
         3eJLbL6JKEzqf28wYySrPnVif4uzkne+HOt93XKUJeCvcgR+w/BfpFkewlU1YSFjf9mc
         AgEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782921633; x=1783526433;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6kqBe/1HqC093rRFcLnOqy3nv640MGtvfx3ayZFRYw=;
        b=V/+ERz9deOVjkSxxNJo8tR9bxuujgDqSZ+2IK1saiL7fMNx0xGm3+jjUK4YKQ8u4xf
         BPlXBSuMW14F/dvD8HrGjT50feeCSrlA0ANYQHJH2PixmTMYgVA6WRGy3Z7vWkVuhr1M
         IlMI8WjYhmHKXF52jmtXZ/HbLycBmNyLlDUqgeKqPsxsBdFBnY9mViTNtbIGKUDA1QkO
         vqKRpUoNrnyBjhnuyUnFo6vjQ5FQtdkr00PTiHb+ZDAu4nwDQkxW0R7yneeq0nqcwTpS
         YsVHJ4xLPp5gH+02ZQ9+OYPFA7PMoHVvfw9EOeFoC67VCX66I/38Yr+CUfI4cc7ZD4Qu
         Q0OA==
X-Forwarded-Encrypted: i=1; AFNElJ92DAfPpPa8Fb0B9+ZCYDh1ndeK4PTMnhY52yUkviMgkFhSV21xD1dffqkKKT3wwyaNFnJ+EwrnEUjANBPY@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi/zPhrVPVTEYIGLLYWqFQ/AKn9dAv61sss4jpvuQvgZhNLPKK
	bRUdSp0jdRgwYB6oMHA7lpzMVIUulga5ctLrzy1bguKcPRiMDZHkqe9HHPYifP88p+KbE72BC7c
	LQm9JLovpX/x+oppiBNYqbfhkY+uk6S7fJvaAyvSMh3N0v+foX8mk4g5SPXPl9z33nOyj
X-Gm-Gg: AfdE7cm6p7aVEFRsX1HbRs/zppMO1mOZ1lglCmE2PaotyhUXTSQtqSJf3cDri2O03/2
	ukdIjzm7ZpAx3IhlyKUA7266Nocn9LgGEA8XvAsRO+28TOaq+u2J2xRIa2CU83lT9cKY0kPBLeB
	+PUnAC9paNuNZ0PM92AdR0Xsi/7GYhqesycuVlw8OExoOOF08s2XpR682YdjnUpSbSD2SaQXcQv
	p6ujJHGkONxNJSu8Fc3N015AJVnpUQQW+9oTQKguzzZCHlJRww1JQAqZOvQ5WHyoc41kl1GwdeH
	tELzJ1xbyjJcw7kol0iysXoVWfHS6nfsGTOOSBoVFLTc+QoCCm0xcb253eMhEX2TeXTojEpWuQN
	8GJnW5zlLOxDQ3H2gujl0P7FHmBanaMlPwm8SJ59ybFFTh6A2X3L7tWUQ0qAHrOhTjlOY00or2j
	xDTkFLi8xv5DJ6TVpzsK/izwyl9Ox+/7zZcAvO5umlIPkzQVRpbozNgFbb7PPTgTM=
X-Received: by 2002:a05:620a:4549:b0:925:4655:a89b with SMTP id af79cd13be357-92e7b056666mr210554785a.27.1782921631827;
        Wed, 01 Jul 2026 09:00:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4549:b0:925:4655:a89b with SMTP id af79cd13be357-92e7b056666mr210536885a.27.1782921630809;
        Wed, 01 Jul 2026 09:00:30 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d19e03sm296613066b.4.2026.07.01.09.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:00:30 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v7 0/9] Support for block device NVMEM providers
Date: Wed, 01 Jul 2026 18:00:24 +0200
Message-Id: <20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJg5RWoC/3XQz2rDMAwG8FcpPs9Flv8k6WnvMXawY3k1a5It3
 sJGybtP7aWBzBfBJ9AP8V1FoTlTEafDVcy05JKnkUPzdBD92Y9vJHPkLBDQgcFWhsvUv0tf5Lg
 MNEgTNLTUhug7L/joY6aUf+7gyyvncy5f0/x79xd121apRUmQzkfU1FjVgX+eSjl+fvtLPw3Dk
 Ye4iQs+FAvNTkFWQlINxWiVNlRR9ENxsP9Fs9Kia1Wy4L22FcVslW6nGFaMbRSSC4i9qyh2oyj
 cKZaVzhJw1SmlDiqK2yi4/8WxkgC5k9hH4+I/yrqufw3z5J8RAgAA
X-Change-ID: 20260428-block-as-nvmem-4b308e8bda9a
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Piotr Kwapulinski <piotr.kwapulinski@intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 1FhRONpZ0iQuoBz2zwCo-Htr-vg1y8J-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE2OSBTYWx0ZWRfX5qb8cjd9hP6w
 Y274XatJAW1HIaLGR320T7qNfhAUgYISoaJS+S+wT9xsf3fSQB2LxV8KDrklRNc2Wz9NZe8DllO
 2XFSORv+eRUGUlNFjfk3b5RqxB1hpMw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE2OSBTYWx0ZWRfX7zXhy+FEoasG
 JdAJS0jon//JWBlDXnNJSIJk1DGwbXVUgJE8aIIjVeDgWajtHzLglpfERkXekwVxHCTq5g8EZtY
 ygkiDKcNOhy6oPSgONWTPTJTZV9ve1Y0V9P7Ffvx0Gcn+Ns1rjRhhgI3YqdNDy/lL25vM38kFXS
 uougaUV7IXhqO6VpYkzrz04mFt5SdXkdgFi0+hiJ7+B7h+Vt9RS8JoEtw34cfe3oK+mf/rUWCAE
 1Lili8yy+GAfswT23MBY7Fod4YH9/iG+PpPxyQMs/xP1gWiXDmsPcsVU0uc9UFugbsDEGtoMhwe
 8L+OvC4iKg8d8SVM7ip3vjEXgyUMeFGRt7qN66nSz7/tPW1gKu6aZtEcgK5jH9iDcMz16q1ljti
 g6PG7WrwFGCxBnDn5QVL/TQeIXlOrAXAAH/ljfQaVVBZhqITo5BAyBsw/bhzOPqOh0ya4grReu8
 TMf8Sgt5lIPwdDSubDA==
X-Authority-Analysis: v=2.4 cv=T5+8ifKQ c=1 sm=1 tr=0 ts=6a4539a1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=VT4XjZGOAAAA:8 a=EUspDBNiAAAA:8 a=0GYAYOgpis-UCnD6-MAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-ORIG-GUID: 1FhRONpZ0iQuoBz2zwCo-Htr-vg1y8J-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010169
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-115743-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com,lunn.ch,armlinux.org.uk];
	FORGED_RECIPIENTS(0.00)[m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:axboe@kernel.dk,m:johannes@sipsolutions.net,m:jjohnson@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:srini@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:saravanak@kernel.org,m:ansuelsmth@gmail.com,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath10k@lists.infradead.org,m:linux-bluetooth@vger.kernel.org,m:netdev@vger.kernel.org,m:daniel@makrotopia.org,m:loic.poulain@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:piotr.kwapulinski@intel.
 com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 8D6AA6EF938

On embedded devices, it is common for factory provisioning to store
device-specific information, such as Ethernet or WiFi MAC addresses,
in a dedicated area of an eMMC partition. This avoids the need for
and additional EEPROM/OTP and leverages the persistence of eMMC.

One example is the Arduino UNO-Q, where the WiFi MAC address and the
Bluetooth Device address are stored in the eMMC Boot1 partition.

Until now, accessing this information required a custom bootloader
to read the data and inject it into the Device Tree before handing
control over to the kernel. This approach is fragile and leads to
device-specific workarounds.

Rather than adding a new NVMEM provider specifically to the eMMC
subsystem, the new support operates at the block layer, allowing any
block device to behave like other non-volatile memories such as EEPROM
or OTP.

This series builds on earlier work by Daniel Golle that enables block
devices to act as NVMEM providers:
https://lore.kernel.org/all/6061aa4201030b9bb2f8d03ef32a564fdb786ed1.1709667858.git.daniel@makrotopia.org/

It also introduces an NVMEM layout description for the Arduino UNO-Q,
allowing device-specific data stored in the eMMC Boot1 partition to
be accessed in a standard way.

WiFi and Ethernet already support retrieving MAC addresses from NVMEM.
Bluetooth requires similar support, which is also addressed.

Note that this is currently limited to MMC-backed block devices, as
only the MMC core associates a firmware node with the block device
(add_disk_fwnode). This can be easily extended in the future to
support additional block drivers.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v7:
- Rework bindings/dts so that the eMMC boot partition can be a nvmem fixed-layout
  and not a child of fixed-partition. (Rob)
- Add Support for fixed-layout as the nvmem device node itself
- Remove "block: partitions: of: Skip child nodes without reg property"
  This is no more required in this series and will be submitted separately (Rob)
- Add missing linux/cleanup.h and linux/device.h includes (Bartosz)
- simplify nvmem_register() error path using dev_err_probe() (Bartosz)
- nvmem_device forward declaration to blk_types.h (Bartosz)
- Add hci_dev_get_bd_addr_from_nvmem() kernel-doc for return value (Piotr)
- Link to v6: https://lore.kernel.org/r/20260629-block-as-nvmem-v6-0-f02513dcd46d@oss.qualcomm.com

Changes in v6:
- blk_nvmem_add() returns int, error properly propagated (Bartosz)
- Redundant if (bdev->bd_nvmem) guard removed in blk_nvmem_del() (Bartosz)
- Size guard changed from UINT_MAX → INT_MAX to avoid signed overflow in config.size (sashiko)
- BLK_OPEN_RESTRICT_WRITES removed from blk_nvmem_reg_read() (sashiko)
- Link to v5: https://lore.kernel.org/r/20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com

Changes in v5:
- Fixed ath10k binding issue + extended commit message (Krzysztof)
- Moved blk-nvmem handling to block core instead of a class_interface
  This allows correct/robust integration with block device life cycle (Bartosz).
- block: partitions: of: Skip child nodes without reg property (sashiko)
- Link to v4: https://lore.kernel.org/r/20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com

Changes in v4:
- Fix squash issue (dts commit incorrectly squashed) (Konrad)
- Use devres for nvmem resources (Bartosz)
- use __free() destructor helper when possible (Bartosz)
- Fix value return checking for bdev_file_open_by_dev
- Link to v3: https://lore.kernel.org/r/20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com

Changes in v3:
- Fixed missing 'fixed-partitions' compatible in partition (Rob)
- Fixed clashing nvmem cells, document calibration along mac (Sashiko)
- Remove workaround to handle dangling nvmem references after
  unregistering, this is a generic nvmem framework issue handled
  in Bartosz's series:
   https://lore.kernel.org/all/20260429-nvmem-unbind-v3-0-2a694f95395b@oss.qualcomm.com/
- Validate mac (is_valid_ether_addr) before copying to output buffer
- Link to v2: https://lore.kernel.org/r/20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com

Changes in v2:
- Fix example nvmem-layout cells to use compatible = "mac-base"
- Squash WiFi MAC and Bluetooth BD address consumer patches into the nvmem layout patch
- Fix possible use-after-free in blk-nvmem: bnv (nvmem priv) linked to nvmem lifetime
- Simplify nvmem-cell-names from items: - const: to plain const:
- Factor out common NVMEM EUI-48 retrieval logic
- Reorder changes
- Link to v1: https://lore.kernel.org/r/20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com

---
Daniel Golle (1):
      block: implement NVMEM provider

Loic Poulain (8):
      dt-bindings: mmc: Document fixed-layout NVMEM provider support
      dt-bindings: net: wireless: qcom,ath10k: Document NVMEM cells
      dt-bindings: bluetooth: qcom: Add NVMEM BD address cell
      nvmem: layouts: Support fixed-layout as the nvmem device node itself
      net: of_net: Add of_get_nvmem_eui48() helper for EUI-48 lookup
      Bluetooth: hci_sync: Add NVMEM-backed BD address retrieval
      Bluetooth: qca: Set NVMEM BD address quirks when address is invalid
      arm64: dts: qcom: arduino-imola: Describe NVMEM layout for WiFi/BT addresses

 .../devicetree/bindings/mmc/mmc-card.yaml          |  23 ++++-
 .../net/bluetooth/qcom,bluetooth-common.yaml       |   9 ++
 .../bindings/net/wireless/qcom,ath10k.yaml         |  16 +++
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |  32 ++++++
 block/Kconfig                                      |   9 ++
 block/Makefile                                     |   1 +
 block/blk-nvmem.c                                  | 109 +++++++++++++++++++++
 block/blk.h                                        |   8 ++
 block/genhd.c                                      |   4 +
 drivers/bluetooth/btqca.c                          |   5 +-
 drivers/nvmem/layouts.c                            |  13 ++-
 include/linux/blk_types.h                          |   4 +
 include/linux/of_net.h                             |   7 ++
 include/net/bluetooth/hci.h                        |  18 ++++
 net/bluetooth/hci_sync.c                           |  41 +++++++-
 net/core/of_net.c                                  |  49 ++++++---
 16 files changed, 332 insertions(+), 16 deletions(-)
---
base-commit: c58ba8c7e9ab26b5e8d91f8ca0e0a16c2ae318e9
change-id: 20260428-block-as-nvmem-4b308e8bda9a

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


