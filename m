Return-Path: <linux-arm-msm+bounces-98112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HKUHckeuWmbrQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:28:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 128422A6B2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:28:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 53BAD313241D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 09:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 155E835F17E;
	Tue, 17 Mar 2026 09:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CDyc6k6e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AMkp3W1o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B1E35F16D
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773739277; cv=none; b=FO6D8unZMnSO1yOy9UvXaLRtNUKDUjWrATDwmXxLjMAUj99eBqaeHUATjGJXSSZgBDfoxNnQ6t/RUj93aJhYDUGF8JcOv8sNi1s581orf4i0YOLjGBcHtfKjKtxi0FvKy9Z5hKBBJBmU2M44lSFJ3z4oXq4oJ0eslk85OdRMNyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773739277; c=relaxed/simple;
	bh=V9vJlqUjWWSiOMNuIvuXw+zmUOQIpm9l1vCQFhHOc6E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mVOgC0FB/yPXjIb7Yjm1guKCuCLvjAjdEYD3PkHQsqOfw4Wzgu9+kUqxfmQrlhAfo3T/tDUChrOsaq960l9ZX2oycE49M5eiUtOBVYbubS7wJ2depZ+7j4C1r3es0KcYf5Mk7COSWRKwjWciC85O/lxzUzb/IyYGQPUH91V01Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CDyc6k6e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AMkp3W1o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H7GleX1639392
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=it6EbdBvJ4URnoXfAGiH/e
	qnM10GsgYYtYhFyFi2EV8=; b=CDyc6k6eo7Nn3fCSnbwR8x6NGcPG6ndpLY6Kw7
	GcNrCvrVJa7JU/N9Aw4WNmOkAfU+GTLNM7TfhrUS9Uk8aI3kH0HBAaS21LYF+AmI
	ynseHRhRvFOl8epe9ZOEBFl9syLliH99sO2GcQsibXNomHgs0YGCn6vl6CUCiIRm
	cS1+QqQIatzhvj1o9g93Cg3DCIU+jwOqyjqo2GZzpCzW0N6bmMIPxAulRwHq2ZbT
	IHyG0qY0e/oQNc0YKWoEEvag8K07jz9jYTISbOSv3T8it8Yprv3Aoi3/NqlGJeBH
	MPPhtFuj4dFv72k6YNoLxlYgFBH8Q7H5sDFsLRvEAYy2JpyA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxke0bjv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:21:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35b9894f9ceso2785804a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 02:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773739274; x=1774344074; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=it6EbdBvJ4URnoXfAGiH/eqnM10GsgYYtYhFyFi2EV8=;
        b=AMkp3W1o6LmQHZNVXMmPvwK83btGb9FEz7iKCpfmE6+zcNfr0z6nCAwmBPYAhAXV+D
         4rvqiLnQsbnDyrxxeK6roOQppzhxoMV8zrJWJWzg81t/AnWqBJWebo1AmswaHk9UfEfR
         smECOpOgWvgsmChg70PTan4Rv41Hf+qDdOccuTWxzasZxIZrfrep+/7Z3z9qjvBngvZv
         oVdSlk9d9lcDJsdweNW+SBTxuysptL4RUkbdm14A7N7cVfq08fQ1k2zHtp60Bq2gnRoI
         5sUUDE0J2EZNan58DApT3cZ4LBzuU33iSWfOjcc8bg68ZzoUquOMpl2vbLp+6YmIl9D6
         YrHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773739274; x=1774344074;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=it6EbdBvJ4URnoXfAGiH/eqnM10GsgYYtYhFyFi2EV8=;
        b=NyZIl2oydvnUr8s1Q09gyHAqTPnqRO2IBQBKr0L+22+bri6KuMeGP3uwclZEEba974
         +uLuhCWS4emYaqYt/x6ZWvOtKb48WbMRfpt2cpZztWODQZTZPYfEyA6xkL8SuLK3/J0G
         HxQzxRkF1hvz1UO3eQEc21JDypWDmNwhU+arFp2Bxfr7wr4OMr+jOxf+jClwNDSIV1ZH
         9aYFl/zt0XruYQoGmQYb6IuFd6+crq3f59U3eiEjI769vUx78WzfHIW4pto1OjULcx4K
         GupuOzNMNxFAdkEW1V6GPLqso/SIGzG4sPNRD6o6xSj3dmV5XLrGDQIN8khNGu/Cjzs2
         QDHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq153JadVz9rs+18hJTPC3wFjMXU/anu1EGIb3S/dYJG1On39zdP7RiUgS/PIb2Go9lSAW74eqWjqfOMrw@vger.kernel.org
X-Gm-Message-State: AOJu0YwV9uAJs7m5YR6xzPnxdONR2HHEGp+CUIxSm7OF6zRurmCUHjgg
	udqCprcvZCjfaWeIX3XkeoBXQqrm6RIRiO09EKatma9NFD0qcO+JOpJf+8dJdE84A7edLCSXSbS
	cmtteCQcHk8tzHhURkBePo+bCiBSehcfEfEQuVD8Wry+eMkoP6R+n1q59/8+4cCBg5E5o
X-Gm-Gg: ATEYQzxx7QvOj40c5AglEBT5+Z5Ua8oGOxZVKULKzHh6UuooAVlZhqMfJV28eLRKerc
	HIiNYEs2s/sR4dvBQDnr/yS/cmtEcbFyUVR2zmKlq7kP06qR897+SYQ9giMOVyl5lzNfSCsmfrw
	48EsENBEdWK0Qf8TgJJpdnUTlQXTkhtRg1ZNWu+P+H+FhXlIwy7rT/ZyRaa/UiS8/tGursgzTJZ
	1v+UZeYgCLQOMuO2ZiqYJqh6a69Kt/kuyugytIC/eUjau+HMAseVocJTmvn8jggMeyJxnj1lCtm
	RfFYwPaUGMDKktI3YSbFb3MSN8BCbf6kNsDucGbGgJmT9hrvdl77VdCkNIiHo0OUBR1c1FInsBS
	Cd+VMQtVqCnyE5Dq3Pr2cG4+KJvSnm3XFZ3jGryVWhhBuwM4=
X-Received: by 2002:a17:90b:4e86:b0:359:7b9a:2cec with SMTP id 98e67ed59e1d1-35a21c808f9mr14878250a91.0.1773739274242;
        Tue, 17 Mar 2026 02:21:14 -0700 (PDT)
X-Received: by 2002:a17:90b:4e86:b0:359:7b9a:2cec with SMTP id 98e67ed59e1d1-35a21c808f9mr14878205a91.0.1773739273720;
        Tue, 17 Mar 2026 02:21:13 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35badbcdaa6sm2331968a91.15.2026.03.17.02.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 02:21:13 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Subject: [PATCH v3 00/12] Add explicit clock vote and enable power-domain
 for QCOM-ICE
Date: Tue, 17 Mar 2026 14:50:39 +0530
Message-Id: <20260317-qcom_ice_power_and_clk_vote-v3-0-53371dbabd6a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOccuWkC/33OTQrCMBAF4KtI1qbkxyTGlfcQCTGdatA2bVKjU
 np3oyCCCzcDb+B9MxNKED0ktFlMKEL2yYeuBL5cIHey3RGwr0tGjDBJKCN4cKE13oHpww2isV1
 t3OVschgBK6kVWTWCcGlREfoIjb+/9d2+5JNPY4iP97FMX9uPy/+6mWKCQROhlZLNWrjtMPpqu
 NpLKbVVGejFZ/YlOf3/amaFPGjHrFgpWmvYhpR+yHmenytzEFYgAQAA
X-Change-ID: 20260120-qcom_ice_power_and_clk_vote-769704f5036a
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773739265; l=4566;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=V9vJlqUjWWSiOMNuIvuXw+zmUOQIpm9l1vCQFhHOc6E=;
 b=/2JeI9xdKvYipr1jnJcYgMA2hB+FsgRvnEA8g3UWVbYlkaYkrI0UzRp5YVnLlaCTtx+k6Jkw4
 ZVIpkab7/oWDfUjlZnn4DSi7/RpcCev+Y/goPI1PPS2eSG2DvEFw/CR
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: VQIW7C93H_4jnJ0dglhId_T2JqLo0Slj
X-Authority-Analysis: v=2.4 cv=aue/yCZV c=1 sm=1 tr=0 ts=69b91d0a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-kUcK9qbmMDI6-bBbbUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA4MiBTYWx0ZWRfXygv6dq8JTuoX
 Y/V67cPIThTtVsPSb3j0dbe4GHrFZkt56qjnS+FQB3FbTrlhLw7f/bKKqMa+efqmQ5qIgAB1xtF
 mHJyX/8yR4rtngalHf/IHuIdxnkkWYj4wCC9n7jYD2pivQzuvwJSyhx3wwXIe/pVYs4wdGdoJBm
 9CQG51nrdQ4hNB4MsHmGV9QztjLaL70G12kJAZZyp7rFjhAK076Ufr/7gHhpSWTsPa5/BGxanKq
 xJJNi/aICqU1GKHZng9EbMnkCLmeQGYbPFFG5igZxrfyz1BeiLIY1xmifjHF57R2xKPhsnW4RHs
 L44e8Za7u0syVPer33+mAD1HQdp7KJupu2TN4kT3H5KYtYgO/xJBTEcsZj+8LeW4JjSrCPu9p+W
 /aUzlfc9JLthANmFMyNM3J+j+kPPkYL7062ftyejdk4Fgv/IY6j+xuYUII3X7BOXANHUH3h5w03
 Pi+fXDqbxqrKYrh+ipA==
X-Proofpoint-GUID: VQIW7C93H_4jnJ0dglhId_T2JqLo0Slj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98112-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 128422A6B2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When the kernel is booted without the 'clk_ignore_unused' and
'pd_ignore_unused' command‑line flags, votes for unused clocks and power
domains are dropped by the kernel post late_init and deferred probe
timeout. Depending on the relative timing between the ICE probe and the
kernel disabling the unused clocks and power domains occasional unclocked
register accesses or 'stuck' clocks are observed during QCOM‑ICE probe.
When the 'iface' clock is not voted on, unclocked register access would
be observed. On the other hand, if the associated power-domain for ICE
is not enabled, a 'stuck' clock is observed.

This patch series resolves both of these problems by adding explicit
power‑domain enablement and 'iface' clock‑vote handling to the QCOM‑ICE
driver.

The clock 'stuck' issue was first reported on Qualcomm RideSX4 (sa8775p)
platform: https://lore.kernel.org/all/ZZYTYsaNUuWQg3tR@x1/

Issue with unclocked ICE register access is easily reproducible on
on Qualcomm RB3Gen2 (kodiak) platform when 'clk_ignore_unused' is
not passed on the kernel command-line.

This patch series has been validated on: SM8650-MTP, RB3Gen2 and
Lemans-EVK.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
Changes in v3:
- Dropped "_clk" suffix from clock names in DT binding and sources and ensure
  ICE driver looks for these updated clock names.
- Updated commit message of DT binding change (Patch 1) to explicitly state
  that the change is preserving backward compatibility.
- Introduced new DT binding commit to ensure eliza and milos require the iface
  clock and power-domain.
- Check for IS_ERR() on devm_clk_get_optional_enabled(dev, "iface") return
  value.
- Minor beautification of dev_err() prints as suggested by Konrad.
- Rebased onto latest linux-next tag next-20260316.
- Link to v2: https://lore.kernel.org/r/20260310-qcom_ice_power_and_clk_vote-v2-0-b9c2a5471d9e@oss.qualcomm.com

Changes in v2:
- Updated the DT bindings and ICE driver source to ensure no ABI breaks are
  made in this patch series. A follow-up patch series will mark the clocks
  and power-domain as required to preserve bisectability.
- Added list of allowed clock-names to the DT-binding.
- Added Fixes tag to mark the original regressions and ensure back-porting
  for stable trees.
- Updated the commit messages to explicitly mention the problem of
  potential unclocked register access and stuck clocks during probe.
- Dropped explicit calls to pm_runtime_* APIs from ICE probe, suspend and
  resume.
- Link to v1: https://lore.kernel.org/r/20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com

---
Harshal Dev (12):
      dt-bindings: crypto: qcom,ice: Allow power-domain and iface clk
      dt-bindings: crypto: qcom,ice: Require power-domain and iface clk
      arm64: dts: qcom: kaanapali: Add power-domain and iface clk for ice node
      arm64: dts: qcom: lemans: Add power-domain and iface clk for ice node
      arm64: dts: qcom: monaco: Add power-domain and iface clk for ice node
      arm64: dts: qcom: sc7180: Add power-domain and iface clk for ice node
      arm64: dts: qcom: kodiak: Add power-domain and iface clk for ice node
      arm64: dts: qcom: sm8450: Add power-domain and iface clk for ice node
      arm64: dts: qcom: sm8550: Add power-domain and iface clk for ice node
      arm64: dts: qcom: sm8650: Add power-domain and iface clk for ice node
      arm64: dts: qcom: sm8750: Add power-domain and iface clk for ice node
      soc: qcom: ice: Allow explicit votes on 'iface' clock for ICE

 .../bindings/crypto/qcom,inline-crypto-engine.yaml | 35 +++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  6 +++-
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |  6 +++-
 arch/arm64/boot/dts/qcom/lemans.dtsi               |  6 +++-
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  6 +++-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  6 +++-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |  6 +++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  6 +++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |  6 +++-
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  6 +++-
 drivers/soc/qcom/ice.c                             | 17 +++++++++--
 11 files changed, 94 insertions(+), 12 deletions(-)
---
base-commit: 95c541ddfb0815a0ea8477af778bb13bb075079a
change-id: 20260120-qcom_ice_power_and_clk_vote-769704f5036a

Best regards,
-- 
Harshal Dev <harshal.dev@oss.qualcomm.com>


