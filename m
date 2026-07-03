Return-Path: <linux-arm-msm+bounces-116329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0pRTOAfBR2oiewAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 16:02:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A31703375
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 16:02:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SRcHTfPK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ERoQ6HNC;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116329-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116329-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE6E43019050
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 13:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6FD23E5EE7;
	Fri,  3 Jul 2026 13:45:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE5D3E5A23
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 13:45:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783086344; cv=none; b=Vi7soKTPmdoLuQV/sPnUNQ/KysBVqKr3A1DsfFclMRvR837SK4TyXsqV1gwh3cPY5bjejg69We4bkg5XjWooh0PBJwwaSeVpfftU3ExgYXD9O7PanA0ZkNEhotIjS0baUSFL/1mFKJddZ3MlnEpMtA2eTJ+waTntbKA4WOJWt+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783086344; c=relaxed/simple;
	bh=U/Z+wdbfmdI0FkKVeS+XsAUoGZeWkpBSbkb3VilFKm4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s73ofnqEEpQtcEeg51kzVseUz09p8Z4U+ZjFzNwz0Jn2ZbjCT7MjUgAesg4FT8AS3oTGANb2102jVqe5QhvVoFQJN/9bPmhh2bjJATnZnMCuJ6PG/iGtbFXNKQ+gstt2HPtCOCM66dDz2jeEqsTvSuDJKotvPVimSo1X/bnKHlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SRcHTfPK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ERoQ6HNC; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663Br4Rm4091453
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 13:45:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ymluYMdTXrBgRp9HUa28auzpvVc2fSgjsJq4S7Nyu7s=; b=SRcHTfPKElZH7zR5
	N6x+mjOo4lfkFtVGi8gtj5mc8cpAnKNjUlj5WEbvsYAjET476Wivw5BFYgWov6/g
	C4T1ow2dY8Ar7eHAKGP5glgAU/9fwADqrA6ZGf7ujm5y0tKidxdl5eftbtZGQnAU
	uOXKnwufHmthmj4tntMfgvDVtSPg+7y5pkxHKiM+7pooMz6tRqWhacQZy81kVdDJ
	OatAi2KdZxut9XIFAFo4IcdwSuC2P8Q9HPLlVgeiYo8ZE0lylKX/P1d4mgVEIOxA
	2Y0KqX6PB6ExMOmRAj7MfpBRJLRec0Q1zu5ap2R2vbwi7ISn13veBJwpLnTkchYc
	sI9pog==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ckj0cmc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 13:45:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ac0a54110so67582885a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 06:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783086341; x=1783691141; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ymluYMdTXrBgRp9HUa28auzpvVc2fSgjsJq4S7Nyu7s=;
        b=ERoQ6HNCTV3Do5LOkR9+NXlAunq3K4ctnX+YyQgYbCs14yoxmNuLRH1OrJij7fikzD
         KwOoj63Rg7L8ydFuLOk4w5wiyrGpyEJB/l2TRdJOyA4BQxdKqzBuwMKt0KzdfvadYY4f
         Q/KxRSsbKC973/FXEKn8WPaeXU+JnIbc0c3smArKFi+dT3lOOiiA3fTTXqqDC411ESMB
         IOS8i7CMPn4h8sNLMWIVQxY8Rhjso13yH27KG1ha4lnIDFgd1wmdsfes+zBQOkjI5SBB
         ylc9ZmVAt7R9jTW2gFRhHKYres/I7KS/T2hIWpgJr9ZgIV5BACSpjkJd/AQKkvByCcno
         DOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783086341; x=1783691141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ymluYMdTXrBgRp9HUa28auzpvVc2fSgjsJq4S7Nyu7s=;
        b=Q95ahtp5G3u0cTGDzuUnd/eQLB2SF1060gWJkNWyWga7wKlI7EYy2pDZvUffSAlm7G
         R9k2C6NhY+/5cDhNCYWh+a/FlhMnJLu9T2DQjlMYweJdumBF/tnRyjhvcNDmw+uO+a3l
         QCQN4rz4fCbHZsPygrO5pKdniO6MWRyiXnomPrUp4utcuGNnROwwX2LWpAmEmE5oqaFi
         Or2qDi7oYMoZIasL3b4YiXLZcd0uuOGIH0bF4gavDkgh5kjhETzs6UwJDwi6zE4nUMJa
         Fhk67a7abDT4rwUMO+7E2eOQQPv5ddGmxJpI2teNGorLuDBFhmjuGdeOMa4lADg/ZNr3
         oiUw==
X-Forwarded-Encrypted: i=1; AFNElJ8kdjwPcYiObG+owzbjrQAoSlh3RvyW2AXKcdJnpeCGEHJCAJdisICMlBLLtCG4htoDMXEmDpQ2OkGAO63l@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/T/I+hLBtJ/LADmkABdTmtcJ1PP4cWiImwGEqODjlmlXmtBRj
	cuCYaJiKMiV4gKHEPqHk6/Zbz3AgQDsk6WxZeTXiKSHLjKA5k/6jHa3oGnV8xjoHvymJl1slX2c
	aij7f/ERSinLVbcAOlHQ23VE5uMz7X4To4/dH/6VRBcX9mTk2+PqLta9CLb0W1lMfeQL1
X-Gm-Gg: AfdE7cmNn9M1zHTnsHOBUXCECZD0q7dHJjdcIraedq9iijiSPQ2l4FVk0m8PH7iPCI8
	3rDha7biNLr8cVQpiiFuNQcrpErWgeopJTLG6NRYXDEu7SEG9Yv5VbcaU2Zlh8KmkQF3vJXauCx
	kjkUQXCWBAbEXUURmoUdiwBIh7KQmg9j/uqcUMHa1Wl7QPeYpyguGEKyQ5w8s5ySo4hWs5/Z5VX
	JvR9/wk0frX5tlGKfHg7SyPKQFW3/FXKDvUGpwF2K9aGQ4XgHU6UKsArz1V4kNA00huuO3XQzZt
	El2n+tbB8C4SzMZ3zU79tvDgbaeNVbYgTitbJY3u9kreQm1pZPsVzI6oDvlNQ5NnAoOd5YrDgrg
	1vHZ1YEth8IYHc4CS1/kiQlbBQ0vySWzKHWmnBrRB2uK9f+j16MWEh0+0EHjPcxnNkg+9AvB8g0
	WPrV9Y1yP1G9MecmPQ96URHOZDcMqGtoKojCA9N5UXObAqFl/0j1wAtAg1BTeHUD0=
X-Received: by 2002:a05:620a:6846:b0:915:efa6:d70a with SMTP id af79cd13be357-92e784d06e2mr1356653585a.49.1783086340453;
        Fri, 03 Jul 2026 06:45:40 -0700 (PDT)
X-Received: by 2002:a05:620a:6846:b0:915:efa6:d70a with SMTP id af79cd13be357-92e784d06e2mr1356641385a.49.1783086339645;
        Fri, 03 Jul 2026 06:45:39 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6059e4csm286135466b.1.2026.07.03.06.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 06:45:38 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 15:45:20 +0200
Subject: [PATCH v8 7/9] Bluetooth: hci_sync: Add NVMEM-backed BD address
 retrieval
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-block-as-nvmem-v8-7-98ae32bfc49a@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Piotr Kwapulinski <piotr.kwapulinski@intel.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEzNSBTYWx0ZWRfX24tovW4rCXl4
 aGW+RTsUxGUsdi75ucOqOIZ1tNBMA64AwfWQ4BNkFXfOYM0EtgagVhtjBCOOEUyo7yQ9tTpmyNY
 FuABfnC6+aw4DKyUCugr6UNhAobyDxs=
X-Authority-Analysis: v=2.4 cv=E8v9Y6dl c=1 sm=1 tr=0 ts=6a47bd05 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=QyXUC8HyAAAA:8 a=WlRemHVO3nz1l1IDBnUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 90vs3o1-0ckgCKLrqZtJ6Y09-Vdy8-CL
X-Proofpoint-GUID: 90vs3o1-0ckgCKLrqZtJ6Y09-Vdy8-CL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEzNSBTYWx0ZWRfXwpk81fdps6pL
 Gpg/2cKzX90P1NmdN/7RG8fnf/pWsVv9JbIrHXIWwOaTYIJr/U8tgDfbWg122DKfn0IjcDnO4tV
 UcJ6rEizKsKgWe49jxsMDy84LEQCLkwO3aEz/ik1DyiOaopK26OrXHT4+NJluAVu8QQRSbua6PA
 g96G6ie8SZDSaArXOUOiqmkgyiqsEh6/deounmkHVnMlYoCnL/8L7F8OOmwD1iVk+pb6YmeUHkI
 3DfqROgKlSj1NHRurgcduDIug24Ioeh6QRRcGO5Z5Jt3+2Qy6ClVbXgmSeZEk6J3jjHsurFIusS
 EjRJrqZ6sqTDeQ8Yv+oOpErwu4wD8QcjM446mWuCKJp1O7kDX7u+h3fdatL71PgwsjxonAgm17d
 hrkKh3IfSPPlBl1j6k3RZ9PqTHRssyecQYwlXPoka9mdf1zXHE4+jZ/xAF1ny1f7L0D4IUfL4mc
 N32EYee6pe8ruy2SVPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030135
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
	TAGGED_FROM(0.00)[bounces-116329-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com,lunn.ch,armlinux.org.uk];
	FORGED_RECIPIENTS(0.00)[m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:axboe@kernel.dk,m:johannes@sipsolutions.net,m:jjohnson@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:srini@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:saravanak@kernel.org,m:ansuelsmth@gmail.com,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath10k@lists.infradead.org,m:linux-bluetooth@vger.kernel.org,m:netdev@vger.kernel.org,m:daniel@makrotopia.org,m:loic.poulain@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:piotr.kwapulinski@intel.com,m:krzk@kernel.org,m:conor@kernel.or
 g,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 37A31703375

Some devices store the Bluetooth BD address in non-volatile
memory, which can be accessed through the NVMEM framework.
Similar to Ethernet or WiFi MAC addresses, add support for
reading the BD address from a 'local-bd-address' NVMEM cell.

As with the device-tree provided BD address, add a quirk to
indicate whether a device or platform should attempt to read
the address from NVMEM when no valid in-chip address is present.
Also add a quirk to indicate if the address is stored in
big-endian byte order.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Piotr Kwapulinski <piotr.kwapulinski@intel.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 include/net/bluetooth/hci.h | 18 ++++++++++++++++++
 net/bluetooth/hci_sync.c    | 41 ++++++++++++++++++++++++++++++++++++++++-
 net/bluetooth/mgmt.c        |  6 ++++--
 3 files changed, 62 insertions(+), 3 deletions(-)

diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
index 572b1c620c5d653a1fe10b26c1b0ba33e8f4968f..7686466d1109253b0d75edeb5f6a99fb98ce4cc6 100644
--- a/include/net/bluetooth/hci.h
+++ b/include/net/bluetooth/hci.h
@@ -164,6 +164,24 @@ enum {
 	 */
 	HCI_QUIRK_BDADDR_PROPERTY_BROKEN,
 
+	/* When this quirk is set, the public Bluetooth address
+	 * initially reported by HCI Read BD Address command
+	 * is considered invalid. The public BD Address can be
+	 * retrieved via a 'local-bd-address' NVMEM cell.
+	 *
+	 * This quirk can be set before hci_register_dev is called or
+	 * during the hdev->setup vendor callback.
+	 */
+	HCI_QUIRK_USE_BDADDR_NVMEM,
+
+	/* When this quirk is set, the Bluetooth Device Address provided by
+	 * the 'local-bd-address' NVMEM is stored in big-endian order.
+	 *
+	 * This quirk can be set before hci_register_dev is called or
+	 * during the hdev->setup vendor callback.
+	 */
+	HCI_QUIRK_BDADDR_NVMEM_BE,
+
 	/* When this quirk is set, the duplicate filtering during
 	 * scanning is based on Bluetooth devices addresses. To allow
 	 * RSSI based updates, restart scanning if needed.
diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index fd3aacdea512a37c22b9a2be90c89ddca4b4d99f..56248d4abcb5b1d9993962a9f6bf60bf865b8d7b 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/property.h>
+#include <linux/of_net.h>
 
 #include <net/bluetooth/bluetooth.h>
 #include <net/bluetooth/hci_core.h>
@@ -3588,6 +3589,39 @@ int hci_powered_update_sync(struct hci_dev *hdev)
 	return 0;
 }
 
+/**
+ * hci_dev_get_bd_addr_from_nvmem - Get the Bluetooth Device Address
+ *				    (BD_ADDR) for a HCI device from
+ *				    an NVMEM cell.
+ * @hdev:	The HCI device
+ *
+ * Search for 'local-bd-address' NVMEM cell in the device firmware node.
+ *
+ * All-zero BD addresses are rejected (unprovisioned).
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+static int hci_dev_get_bd_addr_from_nvmem(struct hci_dev *hdev)
+{
+	struct device_node *np = dev_of_node(hdev->dev.parent);
+	u8 ba[sizeof(bdaddr_t)];
+	int err;
+
+	if (!np)
+		return -ENODEV;
+
+	err = of_get_nvmem_eui48(np, "local-bd-address", ba);
+	if (err)
+		return err;
+
+	if (hci_test_quirk(hdev, HCI_QUIRK_BDADDR_NVMEM_BE))
+		baswap(&hdev->public_addr, (bdaddr_t *)ba);
+	else
+		bacpy(&hdev->public_addr, (bdaddr_t *)ba);
+
+	return 0;
+}
+
 /**
  * hci_dev_get_bd_addr_from_property - Get the Bluetooth Device Address
  *				       (BD_ADDR) for a HCI device from
@@ -5042,12 +5076,17 @@ static int hci_dev_setup_sync(struct hci_dev *hdev)
 	 * its setup callback.
 	 */
 	invalid_bdaddr = hci_test_quirk(hdev, HCI_QUIRK_INVALID_BDADDR) ||
-			 hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY);
+			 hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY) ||
+			 hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM);
 	if (!ret) {
 		if (hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY) &&
 		    !bacmp(&hdev->public_addr, BDADDR_ANY))
 			hci_dev_get_bd_addr_from_property(hdev);
 
+		if (hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM) &&
+		    !bacmp(&hdev->public_addr, BDADDR_ANY))
+			hci_dev_get_bd_addr_from_nvmem(hdev);
+
 		if (invalid_bdaddr && bacmp(&hdev->public_addr, BDADDR_ANY) &&
 		    hdev->set_bdaddr) {
 			ret = hdev->set_bdaddr(hdev, &hdev->public_addr);
diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index b05bb380e5f87715e2a4ac38aa7e7eb77c48549f..8f2a2d0f76adc3dd9cbe235d5ad0ed5e1667fcb6 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -617,7 +617,8 @@ static bool is_configured(struct hci_dev *hdev)
 		return false;
 
 	if ((hci_test_quirk(hdev, HCI_QUIRK_INVALID_BDADDR) ||
-	     hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY)) &&
+	     hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY) ||
+	     hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM)) &&
 	    !bacmp(&hdev->public_addr, BDADDR_ANY))
 		return false;
 
@@ -633,7 +634,8 @@ static __le32 get_missing_options(struct hci_dev *hdev)
 		options |= MGMT_OPTION_EXTERNAL_CONFIG;
 
 	if ((hci_test_quirk(hdev, HCI_QUIRK_INVALID_BDADDR) ||
-	     hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY)) &&
+	     hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY) ||
+	     hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM)) &&
 	    !bacmp(&hdev->public_addr, BDADDR_ANY))
 		options |= MGMT_OPTION_PUBLIC_ADDRESS;
 

-- 
2.34.1


