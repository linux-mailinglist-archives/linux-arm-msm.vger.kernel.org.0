Return-Path: <linux-arm-msm+bounces-116323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z0gdJ0W+R2oyegAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 15:51:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B2B703119
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 15:51:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gK54V1c4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=E5Q2dbTm;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116323-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116323-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EA9CF3024EB7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 13:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EEA33D966A;
	Fri,  3 Jul 2026 13:45:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E953D5C2C
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 13:45:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783086322; cv=none; b=fLpQ0ZjvO9SawdPhxrz5smj2POJMXylWYopQYt2IdDeyxzyaInJfOiBWwpv0FHO94CeCg5OLY5nJ4ZFi/YPjDGw9VEEkr6vlwf1zkcEscgr+8NHlv6zBq2c7OKeGvJfNO1A3kLdhVWaDpCUsQehjzr0clX+LDwz940o3zOvqwCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783086322; c=relaxed/simple;
	bh=7eReWioRb+Q+/KfAGRVYTSy1rse7P0q70/gtXocnlCo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Lry78oOeY2VTsnBOqEu8kprGp5s6dNzSJCNc6BjImmQcPdnt7TfXVXklGA+LoDGtWAGJmoLSsgDj2nxw+qvEFq2BVxBMw/K/u0N2gYZGJ1Ix3iPO/h3p506Q8qfn/R9zu1Ql+fuZPIg5ZTj2MG2lt4rWcWZ7CaotAIStyx+HFKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gK54V1c4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E5Q2dbTm; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663D16DB053898
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 13:45:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YZQ9i8ECl/iEEdcBdY078g
	6tJYsRn3VFW0APH0rESAY=; b=gK54V1c4g+ZP7nyCcFy/pshCNy9BgG6htW+8fu
	v1V+om4aFOmwVa/nJTniffCMLFHpCU5q4rNM7Me1+7/9bQH3CwDw3tRqF5uu1A0I
	1zC/mczKB9DS+2ezT8PvxD3kWSFNuUKmm+wjvsoNiufs/NAAh1HtGZM5nFMydVHU
	Zbtf1JUbtn4ddoBqhhFdduy/exsttKWpt+n24Q6OUHi84meCGo6yRGEaTCPKBgzA
	QX1H0bqT1XGkwXaf4pMTLS/pTVDluvKHJ5c6cDIj+fVmpVxCoGHVQA0NQiPZN32t
	HJby9+Vg8KP5Xym+yi57LlroU8bK6DC9iOnQGOGYuGKIX5ig==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6dkkg4m9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 13:45:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e68cb7a3eso106876585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 06:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783086319; x=1783691119; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YZQ9i8ECl/iEEdcBdY078g6tJYsRn3VFW0APH0rESAY=;
        b=E5Q2dbTmzVD+YKxZyc0HbSsrBFiRuPZqRFGzfxkNGfpQiPGt2I01nET5jfpeu7Xpq4
         H4hIk0ZOsvYdl3C+rcaEgqWMsQGTi9LSCiXJ3/tYfKgkzySSg76202kjkuaXwcNw6UPc
         YDzXLumWW6iMOTh1FUxgsVb110sO+rKx4FhHIZULrf7tmHEmNkUMM0n9fPUEsk/k0oQd
         fZsPh/snzHAN/0rLMDX7MnvqJDrbs+PZGr+NnnAI8loFXTdOdL2R3g4MFEPj4iokoyNN
         flsHU9NqEGK1Bc1y3d2E3ZIp8GJXupVHZrbLBc+MKwVvjce9q+ZcplpfHvtD9lvtZrS9
         2LGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783086319; x=1783691119;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YZQ9i8ECl/iEEdcBdY078g6tJYsRn3VFW0APH0rESAY=;
        b=jeniLCTOSrQGEtHjyxiMZgglw74NGPtbo6+XLL6YFvVFE12aNH1acHDZauelAtKaKJ
         BJ9HH/dWHl63/YxXHHYAEkf6xcqY+xuSOVGRhLw6ozv3Ojyjzq3aZx8+ARw5FSyNU7J+
         +uOqYqMEBYUnY/btJLBJUNoM4UwVYWgGokv02n7tX+bjKDi2pyeP8nLpG0HbhdoCCVzk
         BtPGv04M5wFnl/1n7KVr+FmcxnbmwSXCnV7rUrqZqB/Ic+65A+XwB81EW+x2T447vkAs
         bIoi36x3M7Fvph6hBlCCO9q+yuBIvXkckxyfzeZGzc+i2Pa31HmwwKcOS74vegAl11Rs
         tmHg==
X-Forwarded-Encrypted: i=1; AFNElJ+3h/iTQ8TdkiPMhJonD2USpMCldy6lWzaWj+/sfB1qQOTbuMqIwqU6zmdZUryvkD20fn4O4EBMX30bUNjW@vger.kernel.org
X-Gm-Message-State: AOJu0YyFFq5Ws8M/E8a+cXZjXySq6y7LsFAdFf6jB28s5ABO88vn367n
	neI7+4MdyIfn/mSLs8PJc+Ekur9Gxw9fe/fA97Bi1IPCseLiSFvzxLbdwvYQnfRAn/v7B142l6H
	1pwkNLfPEATAhawodK4wD8YLq3yf1yZi9Mvycbm6NCcUupJPCniShD9LnIvtRy1V6T4pK
X-Gm-Gg: AfdE7clL1gJoqDz5L0HXId1ltotf7nxg7o/ZBUCG3hpb1L/i+U5KwWeWKoyqlzp4qvs
	ieq96UQzcXABFAq0VCqWFq6PNo4qFeM+flyPjoBKpeFZKGk307Z+N/MF8572/yeS74sdCpg0ky+
	eXbkH4Ev1OzedL4E8Au6qbL4CFhI7YknylzuYPHMGhQuEyyyttuKs/PwQ3sN/vOrmzPOJ2VyBeU
	A10aFlPedFOn2dzs8CWGMT1ULzm7v8VegjwEXcB3SUeUXokWMMhxTgmxx+3yA2n9pyxTosQQnNh
	hkjYxee3IJfMpDW5IOuPHTsU1fLCeNIUJfnbszvBVVCpmzbZePisNruV54SlvFP94WUnLz5Dt+v
	EhxpLdJCpuLqt1WxbtHieNa4ySr4/xlfYRUHV7kQP0xgQyJD/nGTmoJ86IGjtscYe56sz8wGd07
	xeXVX6uQ5wcpDiyVYDWSkNQTrR57nD++VPbq4K/5uaLLqEkEZo/C83YAhjJrq+UZU=
X-Received: by 2002:a05:620a:4149:b0:925:eb05:d194 with SMTP id af79cd13be357-92e78500b33mr1373518585a.57.1783086318942;
        Fri, 03 Jul 2026 06:45:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4149:b0:925:eb05:d194 with SMTP id af79cd13be357-92e78500b33mr1373500085a.57.1783086318132;
        Fri, 03 Jul 2026 06:45:18 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6059e4csm286135466b.1.2026.07.03.06.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 06:45:17 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v8 0/9] Support for block device NVMEM providers
Date: Fri, 03 Jul 2026 15:45:13 +0200
Message-Id: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOm8R2oC/3XQz2rDMAwG8FcpPs9Flv+mp73H2MGJ5TWsSbZ4C
 xsl7z61lxS8XASfQD/EdxWF5p6KOB2uYqalL/00cghPB9Gd4/hGsk+cBQI6MBhke5m6dxmLHJe
 BBmlaDYFCm2ITBR99zJT7nzv48sr53Jevaf69+4u6bXepRUmQLibU5K1qID5PpRw/v+Olm4bhy
 EPcxAU3xYKvFGSlzcpTSlZpQzuK3hQH9S+alYAuqGwhRm13FPOoNJViWDHWKyTXInZuR7EPisJ
 Ksaw0loCrzjk3sKO4BwXrXxwrGZA7SV0yLu0oflM8qErxrOhMAcFShhj+UdZ1/QMEu6ZwVwIAA
 A==
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEzNSBTYWx0ZWRfX9WJ2BlqHOhoM
 hF+u4NjKOG3N4MeqIT33KMQbu1NiYyBsE4HlUpvrhneEYRXJEJ4ekn4s/RX1rPoSfNbpQFYcMus
 jTfWhuHPN5vvUemv68MDcQ7ZRDd2mUB8qMjgSjCwjrEwKOLq2yQTf3LwkOfwg3D+i0LdBHFB3bi
 T+qgdskf9l9gC+OcgHTeUtuMEtrmV0ZfiotZMHXYKKyX/vOjr3TgwBAmk+34dTMTc2KcXpzd+0s
 R+CSgJVRZayP+gtAdY4WB1zcGopIcNEZzRr0mN8b4AQg4SRcBARG6IgDuM+eG4AdtqYX1Y33QFx
 VQmLkQEuPWck+Jz3/scseHW5+2gvI8DaDLsIocJ1Ykajuxvzqidy/9unPhYzoeozaJsS/Jnwd+5
 kxQpYFsK31kl7X5zk8+wmCASZ8cy1RCXEU9IdjuugYzFRl4apzZ6Eekd8ZgRGgjCa6eiLjdZY/e
 7CZ69lbgzLdKLWVHm3A==
X-Authority-Analysis: v=2.4 cv=LeUMLDfi c=1 sm=1 tr=0 ts=6a47bcf0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=VT4XjZGOAAAA:8 a=EUspDBNiAAAA:8 a=0GYAYOgpis-UCnD6-MAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-ORIG-GUID: c5GE0DZGm5qKSbO11nOMvaECHUzbXMqb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEzNSBTYWx0ZWRfX6CRcl5/88Lls
 5QGwgevEmW0Jbyiiv0/TyQ2dBPonPhfcVWg8vJUd7zex85FZESlhFHbgOv21272001YvCK5cO78
 LwLt0f8RKZgspDzj60A1xMceJf/WAYo=
X-Proofpoint-GUID: c5GE0DZGm5qKSbO11nOMvaECHUzbXMqb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030135
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116323-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com,lunn.ch,armlinux.org.uk];
	FORGED_RECIPIENTS(0.00)[m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:axboe@kernel.dk,m:johannes@sipsolutions.net,m:jjohnson@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:srini@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:saravanak@kernel.org,m:ansuelsmth@gmail.com,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath10k@lists.infradead.org,m:linux-bluetooth@vger.kernel.org,m:netdev@vger.kernel.org,m:daniel@makrotopia.org,m:loic.poulain@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:piotr.kwapulinski@intel.
 com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 37B2B703119

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
Changes in v8:
- block: Fix bdev->bd_nvmem on registering failure (sashiko)
- net: of_net: of_get_nvmem_eui48() now also rejects all-ones cells (sashiko)
- Bluetooth: mgmt: account for HCI_QUIRK_USE_BDADDR_NVMEM in
  is_configured() and get_missing_options() (sashiko)
- Reword blk-nvmem KCONFIG help text to satisfy checkpatch
- Link to v7: https://lore.kernel.org/r/20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com

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
 block/Kconfig                                      |  11 +++
 block/Makefile                                     |   1 +
 block/blk-nvmem.c                                  | 110 +++++++++++++++++++++
 block/blk.h                                        |   8 ++
 block/genhd.c                                      |   4 +
 drivers/bluetooth/btqca.c                          |   5 +-
 drivers/nvmem/layouts.c                            |  13 ++-
 include/linux/blk_types.h                          |   4 +
 include/linux/of_net.h                             |   7 ++
 include/net/bluetooth/hci.h                        |  18 ++++
 net/bluetooth/hci_sync.c                           |  41 +++++++-
 net/bluetooth/mgmt.c                               |   6 +-
 net/core/of_net.c                                  |  52 +++++++---
 17 files changed, 342 insertions(+), 18 deletions(-)
---
base-commit: dffcfe75c722be66aa2669fb335528edb0590671
change-id: 20260428-block-as-nvmem-4b308e8bda9a

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


