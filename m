Return-Path: <linux-arm-msm+bounces-105728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KOOLnCY+GliwwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 15:00:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E16404BD573
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 15:00:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 553153005A90
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 13:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E17A3D8118;
	Mon,  4 May 2026 13:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mWokuxnV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P5R9t1Wh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241D73D7D81
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 13:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777899630; cv=none; b=L5g1t8SCs9dUZqPaaUJpB1X/addka+wU/Cy+IFwCw2EQ5Y56e9BP8MD0A1oVBw3DRk+08CZabDC4OP/SJWARBaxJbprXRDp2u7wZugbGHx9r9wyCbD+0HyIx1mhUvXdjyNPkhdMcUi8uOFB6sXTjrkblbF2McaU5m3kr28AxpcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777899630; c=relaxed/simple;
	bh=QlSLErIpPIrAq7gne9d8LKjCLTvPr9i6cnS5fWdDeh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B87wSofz8seydoX3HPU6I0ke4hEGam+IOQ780sHvLYwdv6CxAEtO1ljMDMp2I2VEvhcE5sgq/KEpbcLx4DGC1ZNAbFIs9F3wHd4vqFOLfmgBwzCkMakE+LAIlBhCxbw+VY28hlBER92hvM8grQ7ewJWq/RuxCgXBuKwpuiCcViU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mWokuxnV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P5R9t1Wh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B4NU02850815
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 13:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y7R5OwNR2sXVADh0qkhRo/PpIXRQLWA2ulWhCmwHzUU=; b=mWokuxnVRKEudnsS
	ZbQ4Do/IOAcWC7ZeYUAq3NclelHZd//45f6uUSByPH7+sscshk/Ot4qOZFrb/uYh
	pErtNbpSZ3GvazMMsXyHboJRvZFBfL1E0JaXL3a22Bec7JwWFvUmt9eTs+ZbMXkH
	T/sbRztwYWbCKpUfp/JAhr6OJna/W7qif4HGdLOKsX95nLxpr4q30NwDdIQoEizD
	pjp6DqpEBGhLioXfGn6tZ+iPdwPU+b+hXzRVtDOzb3/DhDPeZqawG6qJUewpt+xV
	jKH2L443KtNAQmXAzvjLiRGf+4wk6ZGNiSuYUOmeM57mX3ozWCjmlUI+EIpIcKrE
	jLwmOw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwxk1bhka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 13:00:28 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-573ac60fcc2so314052e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 06:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777899627; x=1778504427; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y7R5OwNR2sXVADh0qkhRo/PpIXRQLWA2ulWhCmwHzUU=;
        b=P5R9t1Why0rPUunPxO6Vn/z5IqtQsX82M1Z05nWKQhgB7KDFiNJz9OPLOLqj7jxw5T
         GtzVpygUz/Eu1Gv1zL0C4Tvx/db49JGdIODqN2IFdTOYgimQk7/c/gnyIzFDPZn1YAsS
         GTAwZWzEbZul0WT21RYgk6ys3auPTdiu8q5kqjwh35muMYpc1aIRFNzcba2rOu3VJn48
         51en0Nzu6RBy75EZUtD1IEFG/vDWSKMs8Oou9Hu+PNLea+pCBB5cE4tpVO4CCegVekms
         P9jOn9Wkl660lDCq1aauuY1qadoTRjt98Hs1WWffysICU4jDRF1pYEJ9DZ9XzR/U3pnQ
         tF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777899627; x=1778504427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7R5OwNR2sXVADh0qkhRo/PpIXRQLWA2ulWhCmwHzUU=;
        b=e0wTCLaE0/fJdz5TDAwUc7RZKWJa0XYoaKJIjFNlLkhqhS2WOsIOBj543HSezhYmc1
         l82qNvUoyx4HGv+vJhEE8tSvWuzUFlwRFB5x1/uowdlRlkGqv1JYV4u6D/5zn4N8EJyp
         E0slYOoRVlKAvNuHBoBQ7w3qx5SRuxUqMLjN415U75/BenShp3RhLLK3rEnECLYMx9eA
         isDo6qRSIVr/nPMLlmPAbX6hYju+Uwmius7vgaC1yxAp2Kvfy+WCmAp0fS10M+Gr/Oy8
         It3O95p0Nw+Aazjsdw9th8lyzGv1CkROLilNTKHahVGqBZRZl0uzrEVhKxL9/6JqJexx
         8ozQ==
X-Forwarded-Encrypted: i=1; AFNElJ+NQ7bqMxag/f+3cQ09/k5EswXCogq2UgPTHWhx8pKg5gAnIQ5EyR6HPKOavqQqmf9puqFjOaiONXiI/iDw@vger.kernel.org
X-Gm-Message-State: AOJu0YxbcZSGlvhGNVKq8clNbkHPBp+MzEt2Uha3HWJOhUM15CLnmhqB
	xKPmzUnFdDuR2uIk73ipcDCipvKIlC5qBPuordAHxMIJBpcHra/V4l7Uuf/FiX+5H3wiDZOTBqD
	WSkq3RL2MKtrzApQ5B9ma2BMRATEtFcGQa4VjgvozS44nsBARQLaTRYALHKdgUyctN5vx
X-Gm-Gg: AeBDieumtxoAHAZckVnjEDq9IlSfePZlGu2IKJGb/IbvRXlAifh3lA9sbGZfeVNxv1K
	WWEVA49+Rmc2O+wVCBUL93MPYKxYcZ0dIO+rdGs44V4cPt/E3228/zU7M6S0FhNO288AHWnyMCs
	n9dinCufxtugfqlWRvE2d7YsCUY+RHkpAXg6WuaPxFS57YazWG+VO7sKN7yfWmOoRQgh76SHxf+
	QVuyjfbeP2xymfOfEDaQpLIrbD2VI/RUE7v9y9vN2rSX3Mn7JT9c0dRII9zn/R91iBp79D2ud0D
	wmzqKa29MZbZjgvuGtDJNgE46J2aBswWeL127ArpwFopUyL28C8sn/yHfg+B+2iKnI4k6mjPBdY
	Num60vDKZYqlaglcKw2bcfQX7F+ObYG9uFVNLuWONKPCjyYqnfeQER1IT6R6PyLZY7aItoWKzg4
	zPOqNr5801mImQ8Q==
X-Received: by 2002:ac5:c5c6:0:b0:575:1954:439d with SMTP id 71dfb90a1353d-57519545caamr763026e0c.3.1777899627566;
        Mon, 04 May 2026 06:00:27 -0700 (PDT)
X-Received: by 2002:ac5:c5c6:0:b0:575:1954:439d with SMTP id 71dfb90a1353d-57519545caamr762998e0c.3.1777899627080;
        Mon, 04 May 2026 06:00:27 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6d66c90dsm401289466b.43.2026.05.04.06.00.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 06:00:26 -0700 (PDT)
Message-ID: <95dba514-378e-4f1a-8050-3ee8fe96977e@oss.qualcomm.com>
Date: Mon, 4 May 2026 15:00:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/13] arm64: dts: qcom: eliza: Add power-domain and
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
 <20260416-qcom_ice_power_and_clk_vote-v5-13-5ccf5d7e2846@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-qcom_ice_power_and_clk_vote-v5-13-5ccf5d7e2846@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDEzNyBTYWx0ZWRfX7l/ZOE8DVpyn
 MGxI+KuR1HcRlNo+k0bitj9XRYIvnrOlHebpMgjjj0AOv6wXDnKSiFPS0F77AU5YQKYSQWjDLWa
 NqV1U00saMM2eswp74fk55+SMcRt8WYywz9CAmtlMzCIodq4woj22UFVEgUprBkFGxhi/Lin16N
 FbX4SyP8bd8LUdMyTqKAbGR6DncK5r9t0PMIJG8fY+CVWpXrl9249nR/OLw76kibsXonDIBmX8I
 FIXBYRDhqyeOWPTIKmDHKr6LtugS2De0544Bftr8TiG/vKr7VLovyubvoUGc5kNLGYyiy2R1kYD
 zaLCzA7HEmZfPh3g7U5o/oU+Gzzyxm9HQsJGo3XP2V1mHHAA+MJjjci1/7sz5pr4BTWoNHwmZjQ
 4eU7vmPX8+RDrb7/lXt3xWGeIVKZCXQa/n1VJzc9KbkNJ6LofykxuLvnd9I3SEDha9BIY8LabRm
 RMgO5G9x23JI1W5IQoQ==
X-Proofpoint-GUID: ih9E9XivPDoiUHUs6dFsJyD6JEGvc474
X-Authority-Analysis: v=2.4 cv=bb5bluPB c=1 sm=1 tr=0 ts=69f8986c cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=RcdfdvLsBkETvr5PKcUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: ih9E9XivPDoiUHUs6dFsJyD6JEGvc474
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040137
X-Rspamd-Queue-Id: E16404BD573
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105728-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gondor.apana.org.au,davemloft.net,kernel.org,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
> done if the GCC_UFS_PHY_GDSC power domain is enabled. Specify both the
> GCC_UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for
> eliza.
> 
> Fixes: af20af39fc09b ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

