Return-Path: <linux-arm-msm+bounces-115708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TyGDIZYZRWr06woAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 15:43:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DE16EE45E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 15:43:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ae8E8GKB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fd8PI9wM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115708-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115708-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 431F830B7B72
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 13:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA52F48A2B6;
	Wed,  1 Jul 2026 13:17:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40352481679
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 13:17:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782911874; cv=none; b=fjl1ICcI6MBxu56QPELiqCjCnfmOOp9EEN1/rCaxsAku1U3805iTdwHgMa9qqliZzwP0QN8oaasDYfMl7hc84PjDGDPOX+l5uozMro1LkdsFAkUhmqZeTpU3cZeFONch2qRX86IWzltOvKCgwUohLA209b6l7Lh0YOIi0+wotKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782911874; c=relaxed/simple;
	bh=oS3CBo1q1lmJJDf+N/At33hQ2EF0fdx9bJ33RnNU7EM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=BvU3S+4ABU5dfEpNmuot/B5k6EgU5Xv90MpPly7H+QuRUSfYLIhkAKHxIisTnNlyELuLr64UBSGAJNVwhqxITK6UJqPSJInh9KoQSy/tFIKJJ+ZSMMrvO9TFNpmnzxh4Ce2Q2bgJHVU5p5wYPM6xW6Sz48iEdPXE8G7KveAz5Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ae8E8GKB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fd8PI9wM; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8iKj762021
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 13:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6zWJR/XvOS2g99/3fxQtqx
	gY2PDjdlFCf+hyY8K1DZo=; b=ae8E8GKBKOHu0YsoB733x/HRCNGsG3gOA99e/w
	p57n38MqKVrpD2uXpG9+ZJfknRcah1kDnCxAlw5SavYXeMBuQve6iTuSiDe3nTZd
	6wPgvOKuqQ0fPo1EOKTxwIcPXa2UEELml09ZGnd+LNswXehixKunBD8QfDvo2pGM
	+NRlsDbuoX7dxNdetnqKrgAAEFLpNyPfaHjdiP2GT2C3xAdqeQ8H60Jv39jzMJPr
	PeoH94V/7fT74VGb0ho5JHPPQLWsen1wr5PE1ju6oW9mshhG0V6LrGWdGS9uzid0
	2OV07B3eMYu59tnjiRnBajPM0ehTccUKGqjwLp1RMrGH/uUg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4kgw487u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 13:17:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c987913b08so8643225ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 06:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782911871; x=1783516671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6zWJR/XvOS2g99/3fxQtqxgY2PDjdlFCf+hyY8K1DZo=;
        b=fd8PI9wMtaCiTKftZhyGtDg3jQKc55S04eX5rMzbAEJauHvzr+7SA5e7/XpD5pEYxe
         i/7lo310aoJImJXsKOwlWErKL5FWo+nJaAJnhAmi/LEuljft2DGi+PlrZFiaAqCG/Pg6
         hw+Sskm70FN/halpxjctiKpXq0dzIeYab0Myrwz8ry7f3eCT3ZO6CsMlov8esWc+TH5V
         hRSlZt09W8/6rBpPbzYVErzP586ch31d6ghsCkaTT4zI1AtaGlElHhB+SAh/bK02SiXu
         Y6B8vFiBpKphVPfMyfozb4D2t9CbsUk+bUwvz3aTGNBUYOvpfzSp2GIeake94+Miw5uG
         LZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782911871; x=1783516671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6zWJR/XvOS2g99/3fxQtqxgY2PDjdlFCf+hyY8K1DZo=;
        b=BJiOQ0beXUSgFz9wepW9+RcqJmC5TwT3eIuqgv5H9YQPXrkbVK3aC8YBhNO+8+AHbN
         ikffO7ZHodBehqjshGVnDRUAyxxx6KXpVNtAKNbZL3HgwxtxB7oWRkkFsVStXGVBAgpC
         gR5UV48iCTY7o4dAOQKJSffl2EflwfLDUmQszc38+6DHgkQJJfdW2iQ4skhpY25L2Y7W
         FbkCY9Ln86etueBuVPIzFyaroWEKSAKG+Yyd1/nhR8EV8PC+ifqsZcCxMOdGZ/Z8PmB5
         +PL+wOK4Tw/y2iD+g5fZlcILUhMAFR3qySor1/oB6OPs8a1b3GODqHQqgeXav9Ix3mya
         IRqA==
X-Forwarded-Encrypted: i=1; AHgh+Ro0CjK+fzsHXORFZQqqR7SpVlqMlHRz+EUB8Wh3CvoKTSNXpgZD6E26YxkRQqpmPgnvk641/lmgRl3bkm1J@vger.kernel.org
X-Gm-Message-State: AOJu0YzvkK5ybq5ux9FMLSZ1wcidv8+qYnj447Pg8l3RMcanp/psT4ZN
	HYfif3DY9pnGQdh5LFTPVVKphqnt2RpK0IVZ5X3KiHd6dqXGmBr9/ZeHr+yPK/15aNLgaRfqFLG
	1FNuZToLelTES5Bx2nCCTRgpGn1OmCjPSZrIL49//eRtFPXSmZSEcqQX49kc78cTrbCGkx7RXwV
	sr
X-Gm-Gg: AfdE7ckG3FDosqR0gGogFdtszWTBYKKkw/3x7yW8W/4k7E9ADa7FZg0DGJtnaGoVms3
	X45lpAEkFdkD320GNwHYXifBTopzVoXwxhY5L0LKfD1G2F+jI6lDrNNa8eCPQ4Bpy1XDNl/ybZn
	2cvexOpqhRd0HzbtfvNH2IO1Hdmjb37IabazO4OG95jh3CyP+rO/w9JDnPO9WebK7QvBoZwEWXc
	/ER6lGVnU0C+sL36LEDo4VqEeIEmIVSdc0n5n7/2w/no3hFKUC428Uij3jHkhpXvJJhPdXrh5Jl
	K2uHLoKSBpUznS8gy3ctygFel0axKZYbOyfFZMQ2O4XAEGXsJTJfuyKh9xNxHkfKk6BvQrqT2Kn
	pEgpQO0KH/Ci+sCgyOYEuLoQA+m8RVg4BKD96AbM=
X-Received: by 2002:a17:903:26c8:b0:2c0:b932:866e with SMTP id d9443c01a7336-2ca7e8c38b5mr17166455ad.27.1782911870301;
        Wed, 01 Jul 2026 06:17:50 -0700 (PDT)
X-Received: by 2002:a17:903:26c8:b0:2c0:b932:866e with SMTP id d9443c01a7336-2ca7e8c38b5mr17166075ad.27.1782911869694;
        Wed, 01 Jul 2026 06:17:49 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382bb30dsm31928075ad.68.2026.07.01.06.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 06:17:48 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, Saravana Kannan <saravanak@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        spatakok@qti.qualcomm.com, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, ravi.hothi@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [DISCUSSION] fw_devlink: incorrect ancestor fallback for intermediate bus topologies breaks audio dependency resolution
Date: Wed,  1 Jul 2026 18:47:33 +0530
Message-Id: <20260701131733.870079-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Co2PtH4D c=1 sm=1 tr=0 ts=6a45137f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=P-IC7800AAAA:8 a=HdUZe8yIVH1zskT_ylQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: kcigvP3pOhPbeI5L0FWH9CSxgN4Ge8fE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEzOCBTYWx0ZWRfX4XXttJtckD/L
 uCvAiaxvEBA/FQllvMphwD/1ZG7ZPkcxtd5FZWyO88Vu8PQ7GAtguRy3ckhVmqp5HoStngvwbp8
 5MyBcr0EL6Sue0jjFXULh11y9PNFfJo=
X-Proofpoint-GUID: kcigvP3pOhPbeI5L0FWH9CSxgN4Ge8fE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEzOCBTYWx0ZWRfXwhXFimSIZJuy
 F4C5rqhE7sT7AkfAOz7h4XXcqJ1eB356ZhJ998DAyg2IJZHf06Y++uza+fHCCzj8U30/6MXcgHT
 w8inw+7te/HTi8kgpwqDB2mdkaBuwrFm6IEgnwgK3x8vh/ESr6rrn/PmXIGiCWPMLDeVfOWSGA5
 +hSaMlSH2TVgcUcc5mtcrxHwOjbS++w3Gbup1en5AzJUNi6vhuXCtGP9st4acYOIifyNIAghZbQ
 w+dric29bCFF5qM4NyMOlhjUxGd6RC6UhFBYspjrEOSdrFIcdQeBzSFkEZC93fqlDKL1OYNJAoG
 HDdXbyoiQiJ9eYpbo6HhVjtZX2nfRn3TP7U+n7jbjJ0APkXGxPior7nibq0YosfIA7Yn0FjqYsM
 B5e0mHxPJzGOAibSoeC6s43XCEx8HEM+6SAoPutFFA4JbvO+Qyuk5CW8mQ6LKOzNi//6LTOziFv
 gsg41u7Di74wzPWAMEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010138
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,linaro.org,gmail.com,qti.qualcomm.com,vger.kernel.org,alsa-project.org,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-115708-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:saravanak@google.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:andersson@kernel.org,m:srinivas.kandagatla@linaro.org,m:brgl@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:spatakok@qti.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:alsa-devel@alsa-project.org,m:ravi.hothi@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 59DE16EE45E

Hi Saravana Kannan,

I am Ajay from Qualcomm, and I am working together with Ravi on ADSP
Subsystem Restart (SSR) support for Qualcomm LPASS audio. During our
SSR work Ravi observed that restart does not behave as expected — when
the ADSP restarts, all child nodes of the remoteproc should detach and
re-attach cleanly once the remoteproc is up. While investigating
this, Ravi identified an incorrect assumption in fw_devlink's dependency
resolution logic that causes wrong device links to be created when a
supplier device lives behind intermediate bus nodes that are populated
asynchronously. We observed this on a Qualcomm qcs6490-rb3gen2 board
with LPASS audio drivers, but the assumption is generic and can affect
any similar topology.

Problem Summary:

fw_devlink appears to incorrectly collapse pending dependencies to
an ancestor device when supplier devices exist behind asynchronously
created intermediate bus nodes.

In our topology, q6prmcc is instantiated as a descendant of the ADSP
remoteproc through asynchronously created glink/gpr bus devices.
When the remoteproc device binds earlier, fw_devlink appears to assume
that these intermediate nodes will never become devices, collapses the
dependency to the remoteproc ancestor, and deletes the pending links.
As a result, the intended dependency:
    lpass_va_macro -> q6prmcc
is replaced by:
    lpass_va_macro -> remoteproc

This results in incorrect teardown ordering during ADSP SSR because
codec drivers are no longer linked to their actual clock supplier.

Could you please suggest how we can resolve this issue? Is there
a specific reason for this assumption, as it looks incorrect in our case?


-------------------------------------------
1. AUDIO SYSTEM TOPOLOGY ON qcs6490-rb3gen2

On qcs6490-rb3gen2 the LPASS audio clock supply chain spans a
four-level device hierarchy rooted at the ADSP remoteproc. The
intermediate nodes (glink-edge, gpr) only get their struct devices
after the ADSP firmware has booted, which happens well after the
remoteproc driver's own probe() returns.

The Device Tree hierarchy (from qcs6490-audioreach.dtsi / kodiak.dtsi):
https://elixir.bootlin.com/linux/v7.1/source/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi#L113

  remoteproc_adsp                         (ADSP remoteproc)
      └── remoteproc_adsp_glink           (GLink transport edge)
              └── gpr                     (GPR bus, compatible="qcom,gpr")
                      └── service@2       (PRM service, compatible="qcom,q6prm")
                              └── clock-controller  (q6prmcc)
                                      compatible = "qcom,q6prm-lpass-clocks"

The LPASS codec drivers (VA macro, WSA macro, RX macro, TX macro) are
platform devices under soc@0 that reference q6prmcc as their clock
supplier via DT phandles:

  From qcs6490-audioreach.dtsi:
  ------------------------------
  &lpass_va_macro {
      clocks = <&q6prmcc LPASS_CLK_ID_VA_CORE_MCLK ...>,
               <&q6prmcc LPASS_HW_MACRO_VOTE ...>,
               <&q6prmcc LPASS_HW_DCODEC_VOTE ...>;
      clock-names = "mclk", "macro", "dcodec";
  };

  &lpass_wsa_macro {
      clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK ...>,
               ...;
  };

  (similarly for lpass_rx_macro and lpass_tx_macro)

The intended fw_devlink dependency is therefore:

  lpass_va_macro  (consumer)  ──►  q6prmcc / clock-controller (supplier)
  lpass_wsa_macro (consumer)  ──►  q6prmcc / clock-controller (supplier)

This dependency is critical for correct ADSP SSR (Subsystem Restart)
teardown: all codec drivers must be torn down BEFORE q6prmcc is
removed, so that no driver calls into a clock controller that no longer
exists.

-----------------------------------------
2. THE INCORRECT ASSUMPTION IN fw_devlink

fw_devlink correctly identifies the intended supplier at boot time via
fwnode links. However, the links are never converted to device links.
Instead, fallback device links to the remoteproc device are created.

The sequence of events:

  1. At boot (~t=0.085s), fw_devlink resolves the DT clock phandles
     and creates fwnode links:
       lpass_va_macro  ──fwnode──►  gpr/service@2/clock-controller
       lpass_wsa_macro ──fwnode──►  gpr/service@2/clock-controller
     q6prmcc does not exist yet → EAGAIN → fwnode links kept pending.
     This is correct.

  2. At ~t=7.597s, remoteproc_adsp probe() completes. This triggers
     device_links_driver_bound() which calls
     fw_devlink_pickup_dangling_consumers(remoteproc_dev).

  3. fw_devlink_pickup_dangling_consumers() walks remoteproc's child
     fwnodes. It finds the gpr fwnode with no struct device attached.

  4. Here is the incorrect assumption:
     __fw_devlink_pickup_dangling_consumers() concludes that because
     gpr has no struct device at this moment, it will never get one.
     It marks gpr as FWNODE_FLAG_NOT_DEVICE and moves all of gpr's
     consumers (including the codec → q6prmcc fwnode links) up to
     remoteproc.

  5. The correct fwnode links (codec → q6prmcc) are permanently
     deleted. Wrong device links (codec → remoteproc) are created.

  6. At ~t=8.364s, the GPR bus probes and q6prmcc eventually appears.
     But there are no pending fwnode links left for it — the correct
     dependency is lost forever.

The assumption that is wrong:

  "If a child fwnode has no struct device when its ancestor device
   binds, it will never get one."

This assumption does not hold when intermediate bus nodes (glink-edge,
gpr) are populated asynchronously after their parent device boots remote
firmware. At the time remoteproc binds, glink-edge and gpr have no
struct device not because they will never exist, but because they are
waiting for the ADSP firmware to load — which only happens after
remoteproc's own probe() returns.

https://elixir.bootlin.com/linux/v7.1/source/drivers/base/core.c#L1300

------------------------
3. EVIDENCE — DEBUG LOGS

We added debug instrumentation to fw_devlink's key decision points
(filtered to audio devices only) to capture the exact sequence.

--- t=0.085s: Correct fwnode links identified, q6prmcc absent ---

  [0.085060] debug: fw_devlink_create_devlink:2356 audio supplier
    /soc@0/remoteproc@3700000/glink-edge/gpr/service@2/clock-controller
    not yet a device, deferring link from consumer=3240000.codec (EAGAIN)

  [0.086178] debug: fw_devlink_create_devlink:2356 audio supplier
    /soc@0/remoteproc@3700000/glink-edge/gpr/service@2/clock-controller
    not yet a device, deferring link from consumer=3370000.codec (EAGAIN)

  Both codecs correctly identify q6prmcc as their supplier. q6prmcc
  does not exist yet → EAGAIN → fwnode links kept pending. Correct.

--- t=7.597s: remoteproc probe completes ---

  [7.555169] qcom_q6v5_pas 3700000.remoteproc: debug: qcom_pas_probe:745
    qcom_pas: probe start, parent=soc@0
  [7.597126] qcom_q6v5_pas 3700000.remoteproc: debug: qcom_pas_probe:865
    qcom_pas: probe complete, parent=soc@0

--- t=7.597s: POINT OF NO RETURN ---

  device_links_driver_bound() fires for remoteproc. It calls
  fw_devlink_pickup_dangling_consumers() which finds gpr with no
  struct device and moves ALL of gpr's consumers to remoteproc:

  [7.597160] debug: __fw_devlink_pickup_dangling_consumers:276
    audio dangling consumers: moving consumers of
    /soc@0/remoteproc@3700000/glink-edge/gpr
    to ancestor /soc@0/remoteproc@3700000 (no device yet)

--- t=7.597s: Correct fwnode links permanently deleted ---

  [7.597205] debug: __fwnode_link_del:155 audio fwnode link deleted:
    consumer=/soc@0/codec@3370000
    supplier=/soc@0/remoteproc@3700000/glink-edge/gpr/service@2/clock-controller

  [7.609265] debug: __fwnode_link_del:155 audio fwnode link deleted:
    consumer=/soc@0/codec@3240000
    supplier=/soc@0/remoteproc@3700000/glink-edge/gpr/service@2/clock-controller

--- t=7.637s: Wrong device links created ---

  [7.637952] debug: fw_devlink_create_devlink:2331 audio device link created:
    consumer=3240000.codec supplier=3700000.remoteproc flags=0x124
    (consumer_fwnode=/soc@0/codec@3240000)

  [7.674145] debug: fw_devlink_create_devlink:2331 audio device link created:
    consumer=3370000.codec supplier=3700000.remoteproc flags=0x124
    (consumer_fwnode=/soc@0/codec@3370000)

--- t=8.364s: GPR bus probes — 770ms too late ---

  [8.364221] qcom,apr ...: debug: apr_probe:597
    apr/gpr: probe start, parent=3700000.remoteproc:glink-edge
  [8.364446] qcom,apr ...: debug: apr_probe:648
    apr/gpr: probe complete, parent=3700000.remoteproc:glink-edge

  GPR bus probes 770ms after the fwnode links were deleted. q6prmcc's
  consumers have already been stolen. No pending links remain.

--- t=15.409s: VA macro binds — wrong supplier confirmed ---

  [15.389975] va_macro 3370000.codec: debug: va_macro_probe:1538
    va_macro: probe start, parent=soc@0
  [15.399678] va_macro 3370000.codec: debug: va_macro_probe:1683
    va_macro: probe complete, parent=soc@0

  [15.409155] debug: device_links_driver_bound:1420
    ENTRY dev=3370000.codec (struct parent=soc@0)
  [15.418101] debug: device_links_driver_bound:1426
    ENTRY supplier link: dev=3370000.codec
    supplier=3700000.remoteproc (fwnode=/soc@0/remoteproc@3700000)
    flags=0x164 status=2
  [15.434076] debug: device_links_driver_bound:1426
    ENTRY supplier link: dev=3370000.codec
    supplier=33c0000.pinctrl (fwnode=/soc@0/pinctrl@33c0000)
    flags=0x164 status=2

  q6prmcc is completely absent from the supplier list. The device link
  to remoteproc is wrong. The correct dependency is permanently lost.

------------------------------------
4. IMPACT — ADSP SSR TEARDOWN BROKEN

With the wrong device link in place (codec → remoteproc instead of
codec → q6prmcc), the teardown order during ADSP stop is incorrect.
q6prmcc is removed while codec drivers still depend on it, causing
them to call into a clock controller that no longer exists. Audio
drivers are left in an invalid state and proper cleanup does not happen.

----------------------------------------------------------
5. WORKAROUND — MANUAL DEVICE LINK IN q6dsp-lpass-clocks.c

To confirm the hypothesis and restore correct teardown ordering, we
manually created the device link from q6prmcc to lpass_va_macro inside
q6dsp_clock_dev_probe() in sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c.

With this workaround in place:
  - The correct device link (lpass_va_macro → q6prmcc) is established
    when q6prmcc probes.
  - On ADSP stop, lpass_va_macro is torn down before q6prmcc.
  - Audio driver cleanup happens correctly and completely.
  - No dangling state is observed after ADSP SSR.

This confirms that the dependency model itself is correct — the problem
is purely that fw_devlink fails to establish it automatically due to
the incorrect assumption described above.

The workaround patch is included below for reference.

--- Workaround patch (reference only, not proposed for merge) ---

diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
index 03838582aead..3884d3e96e33 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
@@ -8,6 +8,7 @@
#include <linux/device.h>
#include <linux/platform_device.h>
#include <linux/of.h>
+#include <linux/of_platform.h>
#include <linux/slab.h>
#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
#include "q6dsp-lpass-clocks.h"
@@ -126,6 +127,52 @@ static struct clk_hw *q6dsp_of_clk_hw_get(struct of_phandle_args *clkspec,
  return ERR_PTR(-ENOENT);
}

+/*
+ * va_macro_compat - compatible string for the va macro codec device.
+ *
+ * Used to locate the consumer device for the manual device link.
+ */
+#define LPASS_VA_MACRO_COMPAT  "qcom,sc7280-lpass-va-macro"
+
+/**
+ * q6dsp_clock_link_va_macro - create a manual device link from va_macro
+ *                              to this clock-controller (q6prmcc).
+ *
+ * fw_devlink cannot establish this link automatically because q6prmcc is
+ * a dynamically created device (child of remoteproc/glink/gpr) and its
+ * fwnode link is purged by __fw_devlink_pickup_dangling_consumers() when
+ * the remoteproc parent binds. This manual link ensures va_macro is torn
+ * down before q6prmcc on ADSP SSR.
+ */
+static int q6dsp_clock_link_va_macro(struct device *clk_dev)
+{
+  struct device_node *va_np;
+  struct platform_device *va_pdev;
+  struct device_link *link;
+
+  va_np = of_find_compatible_node(NULL, NULL, LPASS_VA_MACRO_COMPAT);
+  if (!va_np) {
+    dev_dbg(clk_dev, "va_macro node not found, skip devlink\n");
+    return 0;
+  }
+
+  va_pdev = of_find_device_by_node(va_np);
+  of_node_put(va_np);
+  if (!va_pdev) {
+    dev_dbg(clk_dev, "va_macro device not yet registered\n");
+    return 0;
+  }
+
+  link = device_link_add(&va_pdev->dev, clk_dev,
+             DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOPROBE_CONSUMER);
+  put_device(&va_pdev->dev);
+  if (!link) {
+    dev_err(clk_dev, "failed to add device link to va_macro\n");
+    return -EINVAL;
+  }
+
+  return 0;
+}
+
int q6dsp_clock_dev_probe(struct platform_device *pdev)
{
  struct q6dsp_cc *cc;
@@ -180,6 +227,10 @@ int q6dsp_clock_dev_probe(struct platform_device *pdev)

  dev_set_drvdata(dev, cc);

+  ret = q6dsp_clock_link_va_macro(dev);
+  if (ret)
+    dev_err(dev, "Failed to create devlink between prmcc and va macro\n");
+
  return 0;
}
EXPORT_SYMBOL_GPL(q6dsp_clock_dev_probe);

--- End of workaround patch ---

Tested on: Qualcomm qcs6490-rb3gen2, Qualcomm sm8750-mtp

Thanks,
Ajay Kumar Nandam

