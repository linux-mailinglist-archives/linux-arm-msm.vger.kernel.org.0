Return-Path: <linux-arm-msm+bounces-114902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z1rzJCQ0QmoV1wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:00:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BC46D7CBE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:00:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iq4VWTls;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JhFJ5Pfp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114902-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114902-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2BE783042F31
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 08:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4243E3FCB0A;
	Mon, 29 Jun 2026 08:55:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C283FC5A6
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:55:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782723356; cv=none; b=n9MiDGhwjwhTFY6pcqKpNyjosBEoUwbn+5pk83ps30A3WYt5sdpCE/r0G+HdhOaNeP+uOa7BpmJXvryu0eLYKTbxObURYAFQDgpYXoVZLOqa1j68Q73VZ762X6sN7lIiGnB2843EZls89rg9+d0N/5Nz5h3HTwyBQANOuT4gzRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782723356; c=relaxed/simple;
	bh=45LaNgBPxbRtyHZ0FmSbWF4XyTOkfAE6p0u9C1oK9dk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fNwNDGDfo4EBFqpL4U4zBRVe5/2EN0WIukpam/WjbreD6VgDrnx05Qi7gQHjPRDj3BtzJsKPG8/9twiVyjkF6ev5lATEwIJiXueIQ0W14wddscyURQbm+5KXK/uY+MSvxYtxN9IflVVGFVflaOF17gQzaGjckH8alNEmAeWT1S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iq4VWTls; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JhFJ5Pfp; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rHlv2101534
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:55:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8JbaVcxwuW0pNu9X0F52ZmLiaxV03v+NOG21Kfuhl0U=; b=iq4VWTlsEF72+xeR
	4ttGhDzRIivrHn8pUV919TlnjWQskne00TWo/B6pv4C/c5TDY81vqnrJHR4XE7oY
	THxmHiVL61ti1m5iInP+4M1nadSovvZzm3ha+MdheyY+dqx8/d7EBfICmYJVcoeo
	XejDAXu55tkdsr8/EuMbTaqJIgRHXEeNv6EZeFcqTpVxoSLZ4jSI8FM5Us8aE6TZ
	MLm1hyqbfAdaBawkp+nFNEd4bFdPq+n/ah3AdtCjKbEXPdBIYP680DXc+odHnxMe
	+dHBQEZHsdIMBUf1IMMKwqN8o1yg8hGLhkmmlwh23gvMdLBw30CLGe9zBhgrN32C
	zXF7ow==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f279cng5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:55:53 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bd9b850342so1627897e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 01:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782723353; x=1783328153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8JbaVcxwuW0pNu9X0F52ZmLiaxV03v+NOG21Kfuhl0U=;
        b=JhFJ5PfpGSdedGHhIMIkd96xfNqyb5vnQy0iYqaOarZZL7UFNsP0/vyIyEdcWrSSTd
         qWDNcqvwkQqN1DzovU7n1ipla9428RK6aAsFkqIe6BOuZoYhkXHUKQ+fLFlPOo9A7T25
         pqd2gwkKu44jjv0UAnsadhDrCZ4L0J/FGZDLfIGhBzz8paeXuRHNU3BS1qD4AjtqEPzi
         lP1FkZ6Vhv063JrQ6I1maFM9Uv/Gcm2TMQY/BCgK6hD7bMHjobyDT64ELKM83KDqQO8r
         AJXcUSbxRFFTMpmUImm9j9wz9Cw22KU71cFmHJmXatLfGhKGfCjNYmrvefMrmwn/RNQH
         NwBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782723353; x=1783328153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8JbaVcxwuW0pNu9X0F52ZmLiaxV03v+NOG21Kfuhl0U=;
        b=fOo3of/aN5YwrrKK58Kn4Nx0vg1Zf252LpUXF1qaYkaS9pISpGCkjGhyRBI8XfPrKI
         z/RUvAMV14W2WAmCs0meR+eDkA7UGy51w+G9Wol+iNP21uSg+xofpLQ6+WzicH2VFGm7
         8f76fxdOSMEq0C7XAkJCqCbKM7XIa+PD60XQ70ZgURw4qm7vraKluHoAJHOCCR3PHYru
         LqbmCNhgyL2vP8JerAIgLMEc8mvNlb5RRMB5qZC0KNB4w2E/Tl9OkiAqiZpcV4LafDrc
         Jv/M62bzF2WaCW1fThvJ6ibeLVK3RMZ3UxskHi94mI1qNvEftoYwUgWrICB9M8Brv055
         PZhA==
X-Forwarded-Encrypted: i=1; AHgh+Roxea1UhS42X/JNazd/2a07ckTmWmTcL7/I0qmONDRzL6EaSgoDJxp17EFp6sS9j2PCAxANeaiP3zXd1h+B@vger.kernel.org
X-Gm-Message-State: AOJu0YxTOB3m/7UyD5fhCFyr48JlamOcQB3FhR3dTo1hBI6N/Afc5P+G
	fZcsGuyVdoROOAREASfBTGrRsXujDetlkg5z0V9MXBBSxZC8G5w+q5kVaIkHeDh54klV5OoUPoc
	o9yyLHNRoZ/z8r8QMizEpkYGBTcOCYHRB+fTeSStph+ejSbrV5UTmjtJuFuihyCDkAa9k
X-Gm-Gg: AfdE7ck9D/Uv0ee2BEFGIiwEGiEc9601A4MlpRNoVt0UeVmDqRvDOWzCYRX58CPsK6G
	45svkTTtRgN9itAdLwbpp0RClohRRBB1XKyy49pDow+Tr5yBYAM2PqrB3BXVQT4oBz+RG1JB1Vi
	+bIHPnx5iLxbrO9ah21+/wyJIvWKJ6neoyihuKJLixH7qTig6N7YmPGxi94utjl+CkbShb/UARq
	euQ1QIC3ka8k8VR5+p8Wliavkoep2lEYDARk8vvaIVUjAP1KyC4zyqjJPP6Vvl2AYgqjK1LBS3b
	jq3acn+sjb4FhNQq9jG9hEqaWa0rFgq9laRbSioltpxikLVkGTHGKs+zioV2mDSwU25AfECeOX8
	+roLC031XkaW773oKFbgtpUHyw/VxNZgk/tLdvak9ID80fcgTici+PoVdWNlhE93c/StwhbFCPy
	kbFmv3MkkWxZ/YsNFegwF9Jfx24QtQBkyuJoHI95MiNzfXH9IJBL/SGOoXP6bCoFSAqgOZorfX9
	Zbw7O8gWs1Y3Q/uFcE4
X-Received: by 2002:a05:6122:616e:b0:59b:9264:b06d with SMTP id 71dfb90a1353d-5bc2ae3c4f0mr10167366e0c.7.1782723352649;
        Mon, 29 Jun 2026 01:55:52 -0700 (PDT)
X-Received: by 2002:a05:6122:616e:b0:59b:9264:b06d with SMTP id 71dfb90a1353d-5bc2ae3c4f0mr10167320e0c.7.1782723352206;
        Mon, 29 Jun 2026 01:55:52 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f4bc8016sm6558981a12.25.2026.06.29.01.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 01:55:51 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:55:28 +0200
Subject: [PATCH v6 9/9] arm64: dts: qcom: arduino-imola: Describe NVMEM
 layout for WiFi/BT addresses
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-block-as-nvmem-v6-9-f02513dcd46d@oss.qualcomm.com>
References: <20260629-block-as-nvmem-v6-0-f02513dcd46d@oss.qualcomm.com>
In-Reply-To: <20260629-block-as-nvmem-v6-0-f02513dcd46d@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=evzvCIpX c=1 sm=1 tr=0 ts=6a423319 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfX/EXE6e+1SlGs
 +aAtTCl/gsY+4NKSCQLdaXkZa2Ikwmb7Cu+CsdDIiwcNUxb39UOhDowfpKh0DAHEvZyztp9IC3n
 srBVxPOr1yvY/xPpEThT/TBdCAP47RY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfX+WjpUBCwZlsq
 RSt45THbqiFSFfnD8YHMSz1Qd883sNkMXdgspTSglhEvRKGKqG2Iu4lYOhb4BVzlZzPadRslbYV
 Oh5RksSQ9iBhllPU/DS1kswYLsLWAe+VBZpeFB0mZTN8SqLWUPuqG189N8QMe7wFIpLmNIWiOu+
 jtn6+mVIPdXCaq3y55W3S2Gdjvs0rCpZOJiB7qMx4syNKq2arChlF8C2P/3yyV6USKPohv+hElq
 6zBba8Py0eJtLZj229fdMqlPrJ364J17ZZM6mi9n5PYNzAV4CASjA3l5YSwoBfjwKr6YEL7LSDd
 CJ/VOgKZohVqMfSojSvUbSXvhKZ05eqdgeOcNFMOcjNu0gwBuI2gDLtmk/znP4Xi6mlR63m6N1+
 LVS51hZ1yyotRJREaqUmyWGwq2ZuONQKuJ3l/bQ1jPnxxzSvPo1X+RvF+uwtcmWhMSobZQM4QD9
 hXr3fx3/eCtSFLbyRjw==
X-Proofpoint-GUID: Rd-sFx5qhDhsLUKolllJE20iCjlFSojD
X-Proofpoint-ORIG-GUID: Rd-sFx5qhDhsLUKolllJE20iCjlFSojD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290071
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
	TAGGED_FROM(0.00)[bounces-114902-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com,lunn.ch,armlinux.org.uk];
	FORGED_RECIPIENTS(0.00)[m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:axboe@kernel.dk,m:johannes@sipsolutions.net,m:jjohnson@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:srini@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:saravanak@kernel.org,m:ansuelsmth@gmail.com,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath10k@lists.infradead.org,m:linux-bluetooth@vger.kernel.org,m:netdev@vger.kernel.org,m:daniel@makrotopia.org,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel
 .org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 01BC46D7CBE

On Arduino Uno-Q, the eMMC boot1 partition is factory provisioned
with device-specific information such as the WiFi MAC address
and the Bluetooth BD address. This partition can serve as an
alternative to additional non-volatile memory, such as a
dedicated EEPROM.

The eMMC boot partitions are typically good candidates, as they
are relatively small, read-only by default (and can be enforced
as hardware read-only), and are not affected by board reflashing
procedures, which generally target the eMMC user or GP partitions.

Describe the corresponding nvmem-layout for the WiFi and Bluetooth
addresses, and point the WiFi and Bluetooth nodes to the appropriate
NVMEM cells to retrieve them.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index bf088fa9807f040f0c8f405f9111b01790b09377..128c7a7e76b5b089044745f5d6407d6391055fc2 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -409,7 +409,40 @@ &sdhc_1 {
 	no-sdio;
 	no-sd;
 
+	#address-cells = <1>;
+	#size-cells = <0>;
+
 	status = "okay";
+
+	card@0 {
+		compatible = "mmc-card";
+		reg = <0>;
+
+		partitions-boot1 {
+			compatible = "fixed-partitions";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				wifi_mac_addr: mac-addr@4400 {
+					compatible = "mac-base";
+					reg = <0x4400 0x6>;
+					#nvmem-cell-cells = <1>;
+				};
+
+				bd_addr: bd-addr@5400 {
+					compatible = "mac-base";
+					reg = <0x5400 0x6>;
+					#nvmem-cell-cells = <1>;
+				};
+			};
+		};
+	};
 };
 
 &spi5 {
@@ -512,6 +545,9 @@ bluetooth {
 		vddch0-supply = <&pm4125_l22>;
 		enable-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
 		max-speed = <3000000>;
+
+		nvmem-cells = <&bd_addr 0>;
+		nvmem-cell-names = "local-bd-address";
 	};
 };
 
@@ -557,6 +593,9 @@ &wifi {
 	qcom,ath10k-calibration-variant = "ArduinoImola";
 	firmware-name = "qcm2290";
 
+	nvmem-cells = <&wifi_mac_addr 0>;
+	nvmem-cell-names = "mac-address";
+
 	status = "okay";
 };
 

-- 
2.34.1


