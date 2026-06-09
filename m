Return-Path: <linux-arm-msm+bounces-112033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3Bp3FvjGJ2rj1wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 09:55:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAEC65D6A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 09:55:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WR2QPOXw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=baW9WMIH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112033-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112033-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5C3BA3054E21
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 07:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2780A3E832F;
	Tue,  9 Jun 2026 07:53:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7143E6DD4
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 07:53:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780991597; cv=none; b=Y9U///XGXzxt9dFeBtPtMNo24B1jUsAEvx19hX7zhRFd1kjLcT8EXSkeCPx528Q/y0e+u1nXAITQMVYQYE10yVHhx5b7YnmCyVFftGOsD+cI6y6DfgkuXU7TF6NjPsyxWTZCj8zkfqRqdOzFsguV+46rUd+Xx+GjO+zCO8z0FBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780991597; c=relaxed/simple;
	bh=53MOC5eqOHfTcv+JZmgCH0zadWL/SAMKYW9OpqKopEo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FHHbpaJ/Y2CxgDH6OyIJhcPP6QwrQ3+CjMTnzj5XiNjjoxr6e3fNx91u7CXGCkn9s7p6F0lF1Yjo9fJU2w4YHAbDcWVrUvrNeePqSUejHQHpGQO3s8pgmQ9GExL5LSqe8InvSbYv2OIjeFyDqyWbTSLpGpG5tLuOMlm+rvDvxeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WR2QPOXw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=baW9WMIH; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597P8gF1859695
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 07:53:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Bc3f7a+PYfloRmVgEBrBcp
	B0oTfwi5E+mma25qPWbOk=; b=WR2QPOXwAlDHo4kjWwPXq3+xqjQzqWZz/pOcCn
	u1uCdF685AbfbOlFdnPrcH/j6V7rO8USss5dSXfwz89jmNigTZUeMK3NonHngtfK
	G/8yYKsOkYlsr4g3ARnOMmaF5EHU5PzGgc8apKsYdw1r7iq4ZIsWfK54nJGNKH9k
	8vxKIh55tLswEYjd1yGZVHvYGYYJWlji4dYKCdbjd9z8DR8G7Ws0zLD8v4d2/Tnj
	/WxErNGnw/JruqCd1kh1DdW3HZMMiwE5IlWw2ltxTM4Sg+dzaIbRstne4GFjzOAZ
	9owjpFeQyLPNhq/p2duVdx940wVJp6iLnCh6O4NCeXflyThg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epee4g3gm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 07:53:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5177b8df670so85161681cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 00:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780991594; x=1781596394; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bc3f7a+PYfloRmVgEBrBcpB0oTfwi5E+mma25qPWbOk=;
        b=baW9WMIHSUnREDgNc+MVXeEfoL40sOQjk4QsFU6UcdoIFjOnz7eAk0eh97KXbnmYnL
         ohvmj7I5427qqJROSPGI+/+Q47djQZeVYHux5Ey7JGY8UN0kgr5DsY3/pYT+YvYTmSNB
         yqgCu+0ocWOO9w6tr0Oz7OdydOdUEhlUig0j0xN5lTsoKBbNR3TXJgpv+2Yv1EJORz9v
         2Ab2+CV8xfvtQa327ZTZKn9J/avfsZD+0Bb2IQIqGfnmVW6SUwTIV8xmzITM8zIhm4o7
         5eQ5fT4h62q5IRlH6hiASLRnjipXlwNrl6fz9T1RP3YjLsVJCHQe2x7XpEvUPsay6gUG
         KNmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780991594; x=1781596394;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bc3f7a+PYfloRmVgEBrBcpB0oTfwi5E+mma25qPWbOk=;
        b=YyAWVvAk751MxaGosTAbgS+SkybPvHTXFVq9iPDdKhuouZ9Z/bvIm+VJliRD51LnYt
         HSMTlj7B6Si0zXBXNaLAAl2qSYJsVuWSd+qKlnxO5HsTcE06ouwVfYThccpex0hOmPgt
         8hkde710UIi1pqxo5ct7UwNWm/fk5ptf9AOe50LRlDbKoZpAdcNsBz45KO3p0T06i57/
         btWk4Lht8YmM9y7SogpCG8cOgC3ybku3rev8xy+kjkgXOcUpZYznXzlSnbCXE8cQRKHC
         7F6Rzemm3BHuRKkE6KFSvpd8GP28/gCnTKTS3xF1V7rcdnhkmVkmamC0VoUwuyI7OjmB
         JjwA==
X-Forwarded-Encrypted: i=1; AFNElJ+vWHIRv5KNzFebAqOhQzwBGbYziVWHtGwXPCYFN3aTo98liPrYs8VKVYUpyAE7cNTsMQkjdJsxD3SCxxD0@vger.kernel.org
X-Gm-Message-State: AOJu0YwuUmrQJ8CBl3EPMm6Js+0htv56XtqvAgnXs/9hy4J4U50gEDUR
	++RXjcHWczcjEZhGn77citwJi5E11BhbUSFQClVoaO4cJwXCbdlVBBm0z2CGg9zXrOpZdCZlVwn
	dmf7YZTAfyhamlOwqfc83aFKF6+qgHYs8vk4C9+RdbhzWnMxbBZCqfQCOhJO5WQC/pp+6
X-Gm-Gg: Acq92OE0koDidE072SD7GK6w0O3eRln44TvJ2AI8R+rtIa2zQWw5fmt/jli2WozrXNd
	s53oiUEIcL4qZiqJkWVXcZSYHrtCRx06RhJK3hjVlxLPPRYKJo0nhsjUMmBYF1CBArLwhpnqzy9
	4xmwjlTlng3LBgCkAWgRI1hcjLtcEuYWo5S/UWbgjRpoZjlz2FL/o1hk0cpz9FKZLonxXl/0bk9
	EgEvj+GSPlpuAd86SMlSiapU/5GIPXCgTFcTJcpCJiegNhtiShigLUVrclZIs6ObfArsrEyBNK5
	xr/zFjw38ZwIFTfGV28MWIe9XOJ7bTMZSMnYkVmz3STk1eBKiTtHO+RJk7DRY5w5QNzzutY1y4h
	ZwfY+AqT8hAp+XKvwHQ04SHzWwiniJnLg1STum0W+MGtNtB9BwZ55pVahzrvf2+WupivS9TkdJI
	TboFZYPFGGvGDWvvJ83gGqxEGbCyLIjLtQ9xNh2JOxlHaJJXNRAz6woX2MlwRM5lzHQ/PzGqV6U
	hJvWpoI09l3
X-Received: by 2002:a05:622a:120b:b0:516:d73d:2a34 with SMTP id d75a77b69052e-517959d300emr266975741cf.5.1780991593769;
        Tue, 09 Jun 2026 00:53:13 -0700 (PDT)
X-Received: by 2002:a05:622a:120b:b0:516:d73d:2a34 with SMTP id d75a77b69052e-517959d300emr266975221cf.5.1780991593301;
        Tue, 09 Jun 2026 00:53:13 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64303892sm8121631a12.0.2026.06.09.00.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:53:12 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v4 0/8] Support for block device NVMEM providers
Date: Tue, 09 Jun 2026 09:52:25 +0200
Message-Id: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADnGJ2oC/3XOSw6CMBCA4auYri3pg0Jx5T2Mi4EO0ghUqTYaw
 t0tbFggm0n+SebLjMTjYNGT02EkAwbrretjpMcDqRrob0itiU0EExlLhaZl66o7BU/70GFH01I
 yjbo0UACJR48Ba/tZwMs1dmP9yw3fxQ983u5SgVNGMzBCYq54weDsvE+eb2gr13VJHGQWg1gVx
 fKNIqJS1jxHYxSXKe4oclUytv1FRkWLTPNaMQCp/ijTNP0AkmAc1D8BAAA=
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
        Saravana Kannan <saravanak@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=PIs/P/qC c=1 sm=1 tr=0 ts=6a27c66a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=VT4XjZGOAAAA:8 a=EUspDBNiAAAA:8 a=4dfaE-bLb2wR0_rHmkcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-GUID: yeEoTlIWkbgiL-yE6YpOG4bSzeqzrwN7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3MyBTYWx0ZWRfX3qPEGcXsuHEX
 jW0ShX5D+nd7snEQyRZgNcZvRy5Bp+iJGuzi2w4SINqUD6WsR6S4QW1pfMK8Y8hrm4/cdt1xAun
 d0rJmQJwtuWsb1FWooZwpyr5exOHhc5dINU7khQiBmlvbDECXPQ/G/ZsXtTbaGC0q8/Vh0xy1R8
 p/2XL3YopYaFsHsLb0C9ATNPtJOLjjtA/6gLAPYzrs+p3CsN7TBXAhEfCT4jP3/RxOHVisJJilw
 MlYeK+KDabIqL5IXt4oFb9Cir9WE+jCl+gR8XGxRUR+ZIZDV2g8796QP2uIzcI7m+gy1A/w/ih4
 Hh8FqNHlv8LzmQxVZLJiT/IbxVGmCSCIWT0t+QPjlLSPZwEl7WNtMWFodyf9KIXQWob2cw7P1A7
 8JpG9T1ff5b78aReIFu1G/JvK+KaT+sVHs2fJWL1hEr6hG7eNylDq8R8yO5RImi91hVz/P5wby/
 kcU1NSp6X+Th+gz25Mg==
X-Proofpoint-ORIG-GUID: yeEoTlIWkbgiL-yE6YpOG4bSzeqzrwN7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090073
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112033-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:axboe@kernel.dk,m:johannes@sipsolutions.net,m:jjohnson@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:srini@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:saravanak@kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath10k@lists.infradead.org,m:linux-bluetooth@vger.kernel.org,m:netdev@vger.kernel.org,m:daniel@makrotopia.org,m:loic.poulain@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:luizdentz@gmail.
 com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FREEMAIL_TO(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com,lunn.ch,armlinux.org.uk];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9BAEC65D6A5

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

Loic Poulain (7):
      dt-bindings: mmc: Document support for nvmem-layout
      dt-bindings: net: wireless: qcom,ath10k: Document NVMEM cells
      dt-bindings: bluetooth: qcom: Add NVMEM BD address cell
      net: of_net: Add of_get_nvmem_eui48() helper for EUI-48 lookup
      Bluetooth: hci_sync: Add NVMEM-backed BD address retrieval
      Bluetooth: qca: Set NVMEM BD address quirks when address is invalid
      arm64: dts: qcom: arduino-imola: Describe NVMEM layout for WiFi/BT addresses

 .../devicetree/bindings/mmc/mmc-card.yaml          |  29 ++++++
 .../net/bluetooth/qcom,bluetooth-common.yaml       |   9 ++
 .../bindings/net/wireless/qcom,ath10k.yaml         |  16 +++
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |  39 +++++++
 block/Kconfig                                      |   9 ++
 block/Makefile                                     |   1 +
 block/blk-nvmem.c                                  | 114 +++++++++++++++++++++
 drivers/bluetooth/btqca.c                          |   5 +-
 include/linux/of_net.h                             |   7 ++
 include/net/bluetooth/hci.h                        |  18 ++++
 net/bluetooth/hci_sync.c                           |  39 ++++++-
 net/core/of_net.c                                  |  49 ++++++---
 12 files changed, 321 insertions(+), 14 deletions(-)
---
base-commit: 47c4835fc0fed583d01d90387b67633950eba2b2
change-id: 20260428-block-as-nvmem-4b308e8bda9a

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


