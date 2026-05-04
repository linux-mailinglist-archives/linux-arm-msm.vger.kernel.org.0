Return-Path: <linux-arm-msm+bounces-105727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BGKEEKZ+GkAxAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 15:04:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB264BD64C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 15:04:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 406C930205FB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 13:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7260A3D813B;
	Mon,  4 May 2026 13:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FxchUURy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GLG+rFD9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC863D8112
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 13:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777899623; cv=none; b=MICOk6YXhJhGPPXVMP00moWMkW2+kgXFSwvnKOIiWdlNay9+z10N2EAwmPwIwXHKFh2wP6EXXx289Aq/P2P40NK02dw2MOZdo3jBcXfJZIZNem2UEyHK7EpNUP5XooIUJ0MPDh/8hZWONaAgKiTR9StP/BaiIVd/r8cKWZaQ09g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777899623; c=relaxed/simple;
	bh=3ETyxOrqtGoTUmGsxQw9Wv2E14Hi53hSdIXoy1rbroM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jCbk0ynGYi0yE93GNpE47HI7s+VE0sSE8eJLTiFMgNPA0v0UG3Wz31ccR22GV7S/1LBGd/kBLy6rIxN9b2r/pbtaEqi5KJJh5Jps60MA3gzAvgkIwWoI/mX9LTDMXGvW4VwAb/1gKG6BMeFqm4H0fhnil4z253+/ksSaZP/LH1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FxchUURy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GLG+rFD9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B42Gr011314
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 13:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N0ab2drka40CxOU2j1vUZeZOnQB5f+4t6MU8W+kStWE=; b=FxchUURyYHt8yiqm
	HK1RTFu8cMHotutbAx55xZzcb8OU/kOQXGLOvyUsJDotwu8OOjCx4U3TP1aLIoBg
	CjVk+63cQ0rGU3+Eot0UrJU5D2018rbkIVfZC3xWJAg3LF3dg0j9ByhnUaxLS34F
	dUQw075JtM9S9zYEy74K6MiN7lPtGg8XamzsBkBSGaoRJZu+7E3syaH8+sPZ1tjY
	nibOHM3oW2NuLUpyp6Px7WsiwdtHg8r14auRwC2MAXZlHalsP8mOrYWdml6TZZSa
	+TK0d25L6Sv9XRoUWfQvMA3UP9KOp0J0xo3NR5322rqrM6fJwquFvKJmWZ5jyLAw
	rs9/rA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw6mpdxh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 13:00:20 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-60feeae5dd3so347121137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 06:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777899619; x=1778504419; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N0ab2drka40CxOU2j1vUZeZOnQB5f+4t6MU8W+kStWE=;
        b=GLG+rFD9om0+/JBf3IPFlb4//8mCOo5pHhrn8OBoF5GWexTpVUAhRxYRIWdfn/RhVL
         1591JFxzRkqix91Rkr1t4mxw1exiQC31LLTn1wU5EUxoguOvzNkAYRm1/4NershqxTk2
         sPUwcqq5W4OH1dpLub9xUYSbnDJwqbzGV7fNnOI2w419GlKTRgIKGGW2TQF8NhfNUSMj
         D7lW6+cHJ/QAeLQSLzyMuNWF38cIvQrdBqKKVEx+85Cz5AogkmhD8EFOFg6nqwk7t2ea
         UqPVPLujjGQavtgABjvFjr2iy5VXEx1uzbC0ie3RYkEehR3uZ/VPFaB6roodDmcZkVkM
         smxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777899619; x=1778504419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N0ab2drka40CxOU2j1vUZeZOnQB5f+4t6MU8W+kStWE=;
        b=CVh012JZiTMAC0OoFgtSW3NU4DXsTm76H4X0a0dD15HM9UeZ8Y0kv9mh/mk+vQkQTV
         9LKdsFasejxJU1gZmFNv5GKx/2GJVigNXKT+0oXJbTIrEwCHS5uT5SsRBjHbXF9x987h
         OHswC/wpAEK/pUIB2q+nz2TdYKKoi0xwG+Bm24OUhxM4a266pSf7ZdTxZ7BQeZU/5VC9
         PceaROxbTV1S15qAHh/n3T0/MrpJRrO5JR7gcvzsJp4qJpi+H7nCA7xNU6yBvhGBAUXO
         AHBgBt/TNgWDY7ZL2yy37kl96EgcyjVKrQm0zhdGtv6xP+w5zdn4C8NkLGrwV2Ngc2Yr
         XJgg==
X-Forwarded-Encrypted: i=1; AFNElJ+YzBB/CgEfQjknzzFLebwA3lc55xVt5nWnvfblXnzopfhm29LT8ePsPCDMMtOq4v9G85Q87qlPeijI5TAa@vger.kernel.org
X-Gm-Message-State: AOJu0YxD+DBpC6cue/Z8kLM86j7rs813rfQvzjwLvPiXZz2vp3JPLLoI
	9HOk4blcfWEnD4G9Qr/tGTtCMP18cDroLzPCbFZBhT9fL1HoiS/KFyoxIQVQuq+J5RJPJtXQVlj
	YwliQMo46hzXvMrX3YPyngOFs5nAIEuL4n05S3RlqhXJ41Ddyr6nyxBb2HPf8z0RBb8Ex
X-Gm-Gg: AeBDiet4dgSp45SfSnsQ+OoyRBTvpLD2QrKyLnZiYKBAm2Ktzs3ZzvJv0U9XiXbQi5C
	NdStRWV0bpJvJdS0GhFg4+vg6lgnCahE+KW7sVChyw/1piVB/6wiuL/LpN4zZopQBEWqz5QtWhB
	r88DPgk9uaSb1byTAPJf8EnKwaRRmn6SIbi12QlPqLXarKG7msbTvmiXgMtaCcQdMTmXL1IGg+N
	IHT+ljtxja2PjRPJU3vRQL53DuVCW6ACcwE/G2GoKPgUoK7lEWO4/0V8efOrasgXv0hhOsijegM
	eSIAeY94pXQRyNcweEaXanb+w9KfGtEfKSBI2UxICb9oJ2qIHUfZVdGaz/+e8qBEaX59y/90/P+
	BGfHimHurvrBKBvAPn8VWWex2OxLVh9gUEbEQVHXaAexzpyWJbhgPg7sJ5VbjQW9JZeu/+SDiRF
	6LKAWWP4eYc9Vh1g==
X-Received: by 2002:ac5:c9ac:0:b0:575:2300:9f54 with SMTP id 71dfb90a1353d-5752300a733mr673849e0c.1.1777899619250;
        Mon, 04 May 2026 06:00:19 -0700 (PDT)
X-Received: by 2002:ac5:c9ac:0:b0:575:2300:9f54 with SMTP id 71dfb90a1353d-5752300a733mr673828e0c.1.1777899618781;
        Mon, 04 May 2026 06:00:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6d66c90dsm401289466b.43.2026.05.04.06.00.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 06:00:17 -0700 (PDT)
Message-ID: <ae6dc340-0432-465b-8527-24cdfea5043e@oss.qualcomm.com>
Date: Mon, 4 May 2026 15:00:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/13] arm64: dts: qcom: milos: Add power-domain and
 iface clk for ice node
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
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
        Alexander Koskovich <akoskovich@pm.me>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
 <20260416-qcom_ice_power_and_clk_vote-v5-12-5ccf5d7e2846@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-qcom_ice_power_and_clk_vote-v5-12-5ccf5d7e2846@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H6rrBeYi c=1 sm=1 tr=0 ts=69f89864 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=RcdfdvLsBkETvr5PKcUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDEzNyBTYWx0ZWRfX1OAqzETU7/Zf
 zzdcgyFi1hDViLBQgJfVkz6DoAxtOFXmcxDkokHkZEytis728y5PBuEZxHuc8MOgDRU1pfh9bNk
 46xn7ne9l9X91I76XhPqA+B48KH2DAAyphPl229WL12QoZkyaTYeL4fDrcfEcka9Cu2TNPaRFEd
 uTIIKnwcnQRAqmtEJrPVsIyp3+yLbpg46510aaDtoM2C1apn/BFe2FIELdsZked6MJLBUL/uLWl
 yHuxxE5u22xwTecWiV9Uj5ZYZIjxND72zEM8KfKGH5V51S69yOGBktyYtk7Zpbak2Ujj2MkidVx
 BEsw9i3outjzsJB6o4Y0Bdl6w4awlE8pwbx8qZdib51rTxhnFFnY0w/5TJMQ+uMVZVnbYEu9Uo3
 UVsBxgAHqmHM1xNjrZ/Mij9NhGQBjbUAcYalH7Xku/wceT+ARTW2leX2mx+v3hcvXdRNV+yrgDf
 Ph/3Z5Lwp0d+Pl9jXiA==
X-Proofpoint-GUID: 25GuZXlGoI6IykwplxANH11l6yKS-8jH
X-Proofpoint-ORIG-GUID: 25GuZXlGoI6IykwplxANH11l6yKS-8jH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040137
X-Rspamd-Queue-Id: 9EB264BD64C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105727-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gondor.apana.org.au,davemloft.net,kernel.org,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/16/26 1:59 PM, Harshal Dev wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core' clock
> the 'iface' clock should also be turned on by the driver. This can only be
> done if the UFS_PHY_GDSC power domain is enabled. Specify both the
> UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for milos.
> 
> Fixes: 04bb37433330e ("arm64: dts: qcom: milos: Add UFS nodes")
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

