Return-Path: <linux-arm-msm+bounces-99615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNo3A1hrwmmncwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:45:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F82306A74
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:45:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 614E630579F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55CCE36BCF5;
	Tue, 24 Mar 2026 10:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KXlmTcJi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NBxLC+Ki"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE553E3176
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774348808; cv=none; b=fhkQeNfJ7TNXYne0BsMBZFaD8Z9vd+/bExshdotaYubcUjGkLIeKgTWCxIW+39pHZvSOZVKJzVq6mn4CAJiWacwupWYi8/BkGW48yAqa/1tKwQlL+xdKI81YsDVLn9zegiq4wmkqcO0txF3viKyeKRbsRvZL+umfgWBtlmgsGVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774348808; c=relaxed/simple;
	bh=V/t8VE4RIxnv3KlXn6VFkpWMfjuQh3mARrMePng2vJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tr6xvrK+EE59dob/FuizwgowEzT/KrHq+DWQWO97qpc27UoCLkXG5dOa6V12TUpvb3kuTvYraxG/4zgJtrB8y/lX9pn4V5ZjXzS7DBCx3aAzbcfz3bRQNysRaXZgXxcZsHhI8sqS3hEVUedmr8YVlxilSCJ03eiA3bVQ+JIbjYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KXlmTcJi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NBxLC+Ki; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9pFds4060299
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xiLrR32Mkhp9iJsUryaa7C2F1tBnG5NgCMdH592hc+Q=; b=KXlmTcJiWso+drhi
	8Po7MCVRt+eNjoXF9ZRYUBmnzme4Q3Qx/Qmkiabldy/4qPJASm0QEHqlOVZw2Ztp
	zTZuesinNAI3sVHrc0U89UtsDuXwttKnxBGSroZiSRErZdhpU/4pRPgXs3+ElC0l
	shYwHNj9QYqzpVK6DTp/ji1dNzG88oLH2s9Kl7LAS2KAo1yK1O1eQkyDDj9iyzbB
	YCEqRXDxkwoarJ0ksavzkqBrVv+x+rPQqB1Nf0cKp/2b+YdzvFIJ9zKIqs6Jck+v
	pEnrNDf87ri/0qppL4ZbIwDnYkbUBeXw+bwiYmF1225s3Pcv1r8eFVh9MJEmzkEo
	9v12Sw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jsksg2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:40:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b08025f240so55100535ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 03:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774348805; x=1774953605; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xiLrR32Mkhp9iJsUryaa7C2F1tBnG5NgCMdH592hc+Q=;
        b=NBxLC+KiBgWvo62gpl3FAM50F0JegNDxerA9j9OOZ1uTV2M+Ww2sY0TGOR20y8UTEB
         ZsaTzi6azmA0PA7uXQQD9HeNXFApaRaI8b8RHk1O+HdFhxpFsLQRJpwktAAVcuQIrCBo
         dw+iC4xhv/w4vDs0CAN894C97/MVBHcpmMotS4RK+7W34aAmpO2ZxIxbHv3jYRH1soT+
         2Cp/+lZyg/VZX3ZuvdSJKn+WjCYFuZ69DT7buo9PA2ssSYEtVAE1zyr0czT/tDh/OZFa
         8h8OC7No2sJ/D1oUZv+q4LEd9kiTOnnULDjrkAU/+ziber4Uj+QCxNunPKelAstoU6TA
         A8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774348805; x=1774953605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xiLrR32Mkhp9iJsUryaa7C2F1tBnG5NgCMdH592hc+Q=;
        b=RPjD6YgMm8qdJIfOSMXLO1ich/Bns9jbi5q9oyXu8CuV+Y50GPsgcLVMYC4solnF0t
         +4IpOfkrPJNYMtyDBaNcYFc51kMwkJUQ8KXZvuK1i07dbDC4+bs43dlndZiRFDFkaZDk
         1D6DIsR7Ev/w7ua8CbJj03e4fEA4/1pd7s0ht25QglQ1d0LUqtiAyh1r28KCjGFWS13p
         0u8M7T/ZdOHaPoKV+75Fz/7wEYrCA6vaOomeBshGELJmOPmQSdYhmuckwe8LoJvSUDkh
         P43fkqiZPnidJA/qeRwXnoDC4i7X9m+n7KR56od4Ik+Ksh+kAdEu8N8b8q4r0wowEiGM
         U1Hg==
X-Forwarded-Encrypted: i=1; AJvYcCVGtS5Iz7pptl7WRcGoD7ULWDJ/Q/+Qwi4izP2FYKCmAH1EwMzwOKuIWjO3G+r5XXAGsuOf2JKUeRdArjW8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+Qfr6r1RQIy1Q7VhfGm1FvoOOUq6isHNU2NlI9vuMC4v0Wtqy
	EWvph4K/tbZqRhpo5Hnso2m6dwNyHDGOOtD5OiWvYHXmNMG+XBHQ2xUKGqZjOZF7dtlbPrYvewO
	WEmRAgfzcbZ6haYaG7NJlK34g/1twq3j87CiYhPCNhfQSl9bFvI46gzU1rY3pViIsSmjG
X-Gm-Gg: ATEYQzwDfoLgsO8zh4Y3sdeZ7zd0l1G5wlTsYa/zrnc+5Dt/htYX50DUMXNYTgoopPv
	h7hfg0E/BdFBjeaeBvN46cpI/oQHNduuSA/avQWbd0yWt9PK+sIPsOuBu/xxDdDYXcC+BQD970i
	MiET5K4TCn+4Y9aDVqSaEyFhwFHgIWkvtLVy8ikdzxbyJvr+O+x+y81n6BDZwJAScU81PUP0oEw
	6HkNswk5+yLRxvD04MOmejDuTwhk0YczIq9PAL9hhxxJQTN85YMxbHC8zkEQeR5KKIJkoj/7i8h
	P6RF8bhIAtpnszNltMBlK4oF0X6+2ua+g7EQhdLkM2fCyZfRkWQZbNfEj9ypyzU6hadsc5nyKaU
	bpaH9oX/Ydo+GRxe3mJRrU+40vhxHwEDq+NbAW59g+Vb1Xo9NhhBV
X-Received: by 2002:a17:902:d209:b0:2b0:ac1e:9730 with SMTP id d9443c01a7336-2b0ac1e9a37mr4064625ad.14.1774348804447;
        Tue, 24 Mar 2026 03:40:04 -0700 (PDT)
X-Received: by 2002:a17:902:d209:b0:2b0:ac1e:9730 with SMTP id d9443c01a7336-2b0ac1e9a37mr4064185ad.14.1774348803929;
        Tue, 24 Mar 2026 03:40:03 -0700 (PDT)
Received: from [10.218.44.178] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c766255606fsm1101544a12.21.2026.03.24.03.39.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:40:03 -0700 (PDT)
Message-ID: <d66c16cd-0460-4813-803a-dd298f3d7581@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 16:09:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/11] arm64: dts: qcom: sm8650: Add power-domain and
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
        Alexander Koskovich <akoskovich@pm.me>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
 <20260323-qcom_ice_power_and_clk_vote-v4-10-e36044bbdfe9@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260323-qcom_ice_power_and_clk_vote-v4-10-e36044bbdfe9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4NCBTYWx0ZWRfX3da+mI0Wg9bz
 JCDqp0uRhgDCUWC8xUNaSta7bg4M4MimGbWg1ahwmjlQqNlAZ8mR7p8vKMQMcYBZpl/XfydayFB
 NUGxehEkcMqtUa0ucR+J4vdX3oQWZ4CJDsR9sQ4gh9eDvYzfRCq0rnqyIICKHL2ACDgLQ8LlXO3
 PkClIs9B/jidm+CgzWusKP3JZLpGS3HcC0fkH1gRRMx9k7GTaWHmLJ1pCamuJntBTiykPuOBCUM
 66YVjj3BDbRBUTRcnyVvJQKzM5bp6D0RAy+mEKqUTerYjow/zi9APwWqINUBCNneXDUcQyTq8/n
 bT6Ku/BiHn4qeSWtE7c/SaaBny7LAgtOYdwphGmEXKyxTm137OjuNCogTTp7oEbEtbgQtymN/FF
 JNktPfou+Y/bUSGsDq2hzPAVnXTfmZQNACy34vlQjoD00FusnTjFO2ti/Sottd7kwyIGT+eOMUN
 8lqRJ4Lpr3Lr+WxAURg==
X-Proofpoint-GUID: _urCsTGRfSiHBiUvR-VBlTrX3Qbu-g0O
X-Proofpoint-ORIG-GUID: _urCsTGRfSiHBiUvR-VBlTrX3Qbu-g0O
X-Authority-Analysis: v=2.4 cv=I+pohdgg c=1 sm=1 tr=0 ts=69c26a05 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=RcdfdvLsBkETvr5PKcUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240084
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99615-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gondor.apana.org.au,davemloft.net,kernel.org,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 69F82306A74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/23/2026 2:48 PM, Harshal Dev wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core' clock
> the 'iface' clock should also be turned on by the driver. This can only be
> done if the UFS_PHY_GDSC power domain is enabled. Specify both the
> UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for sm8650.
> 
> Fixes: 10e0246712951 ("arm64: dts: qcom: sm8650: add interconnect dependent device nodes")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep


