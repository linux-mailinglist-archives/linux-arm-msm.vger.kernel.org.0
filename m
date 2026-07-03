Return-Path: <linux-arm-msm+bounces-116330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pkmHHszDR2rFewAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 16:14:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C57E8703513
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 16:14:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BjEwQ7KX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=H9HW25Mb;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116330-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116330-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 883FF31A3F8D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 13:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 776223EAC90;
	Fri,  3 Jul 2026 13:45:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C873DA5C7
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 13:45:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783086346; cv=none; b=UZirM6ZVrDCoRN0S3cNyzPaCW2thGb7L1NcHIVcbTcnc9rOMTUVnOD2KSQ3gjwaeER1KdsVM0XpTEIQ5M1ZsGB37baoATWCy99c5v5l0zw+m9snHcikVvxtRcKo038gKBfDMrnDltuZLiwGZwI4jaqy1yQ7xBRY6hU2dVVnZ8gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783086346; c=relaxed/simple;
	bh=xh4ucig5hPRkaGw1GggCAwEU1pqdfnGTPbj3vUFpt5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TZg/WYk9nrzuYGPdYxHtZMx4Kbwv0lH4IvWrPVy6aqem7hv7EwNDjJxn2rX8USmGuyH0ED8UQidizNSYG5dBCtWAZHejuCjfw/IUgxuob5k8MlQSRfUH4u9tuxRXs3OoQPI+CPMcJT6pK1Zg4pDdvlqL4XySjDSmKnln9jaBLPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BjEwQ7KX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H9HW25Mb; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663BUCGW2994880
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 13:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=; b=BjEwQ7KXV91y6w5K
	VaQIfEuSxIf16eWd1haiwUtC/PYzRYiVxl1j5dXjqMoCiigcwbu0X+8vL/TExdy4
	ZgaYvX3s/VjRfFmnLJ2HAxVpoT2At/uvdsGENm8WOfnOSljYzXiflbVP57mea2FX
	KnQYVBSaRc+RTVmHc1S5LvgQFioMJfP0+CNEuyaeFSePaW2SyzXcOQyNvMVcGtyj
	FwwWkbyB25zHbrgMA13dzHUKe6tPQz9z0YNucycudgyRDEQ2qG4QyzaE1Utrt5uS
	gNyLrQaSn/7xmzjyveth3rLNCkQC+OEimnMLDr3jt7aY1uQdm/4UCnx8933DfJ1O
	dXR6hw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n2mw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 13:45:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e7ee64b25so103369585a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 06:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783086342; x=1783691142; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=H9HW25Mb5w4bzpnA8/TdBbTr55d47alBBT2NFDv5GxxOqL2sxUtAhKg5p+5RoGS3Lw
         7DKeZz19g28LAcVhJ3zIp9b9gRzYv4E6CadRmZKC7wtrVQrSHnHPIwDXDjvQEzgrBOOK
         up3mgIXCr/nMXbh7FcPswAUY3UBuEmdD/5HI4R+aSpCA9YoOyUBDCTLp4kPpsrRCaRll
         iNF+6YqfXOItXzrOPcW5WGTIZJVDRHE1piQE+ADMH/G1AdUSR6CTNSxUIc07i41wuu8H
         5DRcUraomGGcwCGvVIdfDM2UFAtDCnOzVrU7v9Bh5ltY0ZDCb6S4PURQaNrh/P2W2dBN
         Beow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783086342; x=1783691142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=tY07/fotc1JI+ZeAwcf3diZ00kGGKGna6YBtS8ss9jJuzcuI90tz44uvGD/jwufx/h
         qUyTMfJ8o0dzQdO+Zadb1EG1VhFZxpJ532Hilv9tLYowi5SRhoBn2sUT4mALBLO4jESs
         bIF1hLqICzrXmttcYAY8qJVQyEFQId/DYQ4qqZAtziiNkdO6im7Rrr6Ng9bpme9l286w
         f4u3H0PC6iwT46dE2p56sp56S6OGkNB2RoBV8lvxcsSVbhd8w8mjKbOrFmsmJYo7hZW4
         HKo28xf5yoPwg+2TWAJS+vooOP6Yy5vPjzDRH/gCBwYAUO4t9z1H7mMyfRR3dkXUTplB
         LFYg==
X-Forwarded-Encrypted: i=1; AFNElJ99sZM9GzU5fzC3DUe7RXzwLqQqVvOIWwkyWFmM9YMK1nc1LbHMGztTXJ312NllZJ+7gGSdJOzZrEHy13Ky@vger.kernel.org
X-Gm-Message-State: AOJu0YwHQHC8alfplEshw0mDrOXH+qLThO+TRy0AI6ywFtdzKfX9n0WB
	EULQZGvgjrkuvttSQQTDYohag16iKZMH3LnEzXEpoVB+kSUJ/OlpOejPk2tGFMByJJFZKpTXDv1
	cD1nzSSqkHcy0Vv2NGM9t2R2cAE9H0Hua2LO8/1yzX4oX58SkvSakc7n+s39LbISmWbtW
X-Gm-Gg: AfdE7cmpUgj8jatN/yOzKeQ+TimxEkT4qKEGytvycUquLcVmHjqQMwCxtT1WpDpEkZq
	4KW5IIQ4mjG4Tk3vj0wXQfsGdTin2HOzoTIJXI6WjbRIYymN2n0SpqoXSLrf/qKUox2ilGOvZTY
	AHKTFlj0aB2Igz4jfu5wmfehVL/RKiGOeqFGahf4XeMl8FvslbuoYuU7NNYwGun0bPy3FUs3/ZP
	9BuzKq8wRas7L1LXcQdz11J1XyY/Fj7OgpngPoDD5c0THaWPY8BQtV13A8dmYjo5pmUmj41da9G
	p8URxyYbwriEIBTCl9W3CJ5Dk0AA4qUBxlWMZXJYA/TIZWXM0LalpsfCt/7ZJAqo1pLuNQ3svWA
	6LT5zaoHffwIJxFVQMnuGytXqDw+4kGLddtpx7yEY3DCNX3rI/FtjzdDYz82/ZRodJcKQw38YcI
	Acsc05d/LNQoIOC/vQKhemdbcMEndgE5Q8G+V4zmPsnihUtnDD2XwQPC2XnhLqAEY=
X-Received: by 2002:a05:620a:2725:b0:92e:6a8d:38ba with SMTP id af79cd13be357-92e7b3dec02mr1223916585a.56.1783086332573;
        Fri, 03 Jul 2026 06:45:32 -0700 (PDT)
X-Received: by 2002:a05:620a:2725:b0:92e:6a8d:38ba with SMTP id af79cd13be357-92e7b3dec02mr1223818485a.56.1783086327285;
        Fri, 03 Jul 2026 06:45:27 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6059e4csm286135466b.1.2026.07.03.06.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 06:45:26 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 15:45:16 +0200
Subject: [PATCH v8 3/9] dt-bindings: bluetooth: qcom: Add NVMEM BD address
 cell
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-block-as-nvmem-v8-3-98ae32bfc49a@oss.qualcomm.com>
References: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
In-Reply-To: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEzNSBTYWx0ZWRfXzOUUYIn5cwUR
 wcUPuCk7kIYPaJf74XMKqHF1Uxt+sXnalI2h9bSwHh6nGENfXsOdJ8Ou0vW8kOzKwvzJCfPt0jf
 5q2zTrwN2QPax+Lyx7HoWl1oz4UIbNM=
X-Proofpoint-ORIG-GUID: oxaZCHxtKPEXkNcsgB39IBKrV8XaDmya
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a47bd06 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jFERsaRKWwo8c2z-USAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: oxaZCHxtKPEXkNcsgB39IBKrV8XaDmya
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEzNSBTYWx0ZWRfXxKBQffRANq+K
 nZS4Zfg3vU7UPt6eSWSz0h5ZB4VJaXpfn+ebn+3bcMIV/l7cGkTd82RbSIef9DsSnS36fPaA4uS
 k0u+08Jua5Dh2NqwcHyA5NAzXgQyR8bOlN3hb0vGEPAEDS2hf9/MRq2AhaJJMLY7zi/c2LjtCKB
 Ab6pdq+nOQGO2Weyxcqw3BsVKZC+crVWlUW5efYOQxij/Ho6RRtPpP1jL3MwYU9XfnPqsHDr/mb
 WSTLVeCveIMkjX4kpZlllx05ep9j8BaVGYnaZIAjYpwYgi9CuOWIx6M60TdOj/n5C7EjFbcqo6/
 smM2qCZKXvz7pR1kgGmAnnyZTIIPYaq50SJYlAxt8xvx/joDHTaRAfQxgw/69SPzuFzJH8RYb5z
 KMaDkWEmbe0bSvdFAa0B2CnO2W91tznyXftUcVwRDZ9b0IBd0J7FEStSxZvzhT38gXgYq+8/QOT
 id5BDLMNi1hWnP6iGmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030135
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
	TAGGED_FROM(0.00)[bounces-116330-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com,lunn.ch,armlinux.org.uk];
	FORGED_RECIPIENTS(0.00)[m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:axboe@kernel.dk,m:johannes@sipsolutions.net,m:jjohnson@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:srini@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:saravanak@kernel.org,m:ansuelsmth@gmail.com,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath10k@lists.infradead.org,m:linux-bluetooth@vger.kernel.org,m:netdev@vger.kernel.org,m:daniel@makrotopia.org,m:loic.poulain@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:luizdentz@gmail.com,s:list
 s@lfdr.de];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: C57E8703513

Add support for an NVMEM cell provider for "local-bd-address",
allowing the Bluetooth stack to retrieve controller's BD address
from non-volatile storage such as an EEPROM or an eMMC partition.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
index c8e9c55c1afb4c8e05ba2dae41ce2db4194b4a0f..7cb28f30c9af032082f23311f2fc89a32f266f17 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
@@ -22,4 +22,13 @@ properties:
     description:
       boot firmware is incorrectly passing the address in big-endian order
 
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Nvmem data cell that contains a 6 byte BD address with the most
+      significant byte first (big-endian).
+
+  nvmem-cell-names:
+    const: local-bd-address
+
 additionalProperties: true

-- 
2.34.1


