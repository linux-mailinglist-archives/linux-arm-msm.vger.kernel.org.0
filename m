Return-Path: <linux-arm-msm+bounces-93569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMGLEnarm2mu4QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 02:20:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8CA1714A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 02:20:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9376F30036C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 01:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83F481AA8;
	Mon, 23 Feb 2026 01:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VLVTKgqA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aKZygpFi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B37B1D61B7
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 01:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771809421; cv=none; b=C4nAyGTzpn51nJJo2CxBfEEcXvfBmNpyYyED67MPv0Bs3CLV6QPzzbq1u5ZOhsyZ+BS4M53q87wT1T8fV24Ox1H4OwfQFDWHeHf5i17plGVsNcL0HwX/SrDBMkZhjst3NVPFrltyBNRsSU9zR4mxEptyGOcGyA8Vl2hlrPP1Ppk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771809421; c=relaxed/simple;
	bh=0Im4acq/Nf2dLlkLQObXe5jJJdgmzcFL4ciKudLiqow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNWHJ8cu/6tQSHC1ASEc6a8L/jyHxv8QhiqirOlREQpED5HUzfPk94M0CA2jLUbDpkXqcQihSRFQzCVdlKFrRyC11VTVogNfNa73ojfkxuwotcfACJsbWu+Bv+bBngYbuhbmmwC+uSf3Rauf/EGvK5rr0E/QYBKqrehDHSKk6Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VLVTKgqA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aKZygpFi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MJvlqI2146284
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 01:17:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=diSKSPgAJBG2NEAYSdP1/lWL
	SKl7GsVB4rIN8R1Vsrc=; b=VLVTKgqA+w9aZiS6iP3ZjrxLNFiMnkXEqJccuWQ+
	GFRHPvP6MXT858eSqik1bDyWZaVPAhGOw91Y2x3eeRwQu39gRStSdDCuga4fkU1j
	p+M5OeQjgEKzihQzgJLvBHY33f37oKjHmOaZqVRglJyJdg/SuMDLOoQlL5c+5gI0
	1wkUccLDETtopE+SKIf5GqaBBVkuHT/9MU3H+kF5PA3WJUaf1YdzOsEc0O9DGkKN
	iVMn/BmUF0TH2ER/kcG2jVHyImXqaxKBxDTTLF1sW2GhdtdyF9gHBKkocfmz0Vx4
	6UeUUuhJ3RsNG5YXd8ELqqMui7N4MApd0O5UR6Qve6IulQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wyu0m2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 01:16:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c711251ac5so3359795485a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 17:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771809419; x=1772414219; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=diSKSPgAJBG2NEAYSdP1/lWLSKl7GsVB4rIN8R1Vsrc=;
        b=aKZygpFikvQ9OhH6314KDhVfBwB2dq9MtZxMUVaEiVj4qLkgdCcpolpS4ym9GADTi0
         g/rkTL0VHZwhbN5l5Pc4WmHO8msEa/K7NCUqQdBReacsyoV6c5idBrKj3AvalSKLED0+
         8wjoFt7+AazT4erLwzMCXJwxKDyICS1HGQkl8vBqUFehhxfZPgISMJsLwiVANPFlD5Ss
         YPU+arISl5HsOQrRyRYdWJHOCoGPWXmApacfp/iO6QQdtY4JtnP1cgroN4zlkx0QPJBb
         +ozCG2bf3mV+NXvOT28caACLO4A70mj1QmY7dws+4HRcjdN4QcZ2yQJNqjIfg9+FqR01
         dA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771809419; x=1772414219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=diSKSPgAJBG2NEAYSdP1/lWLSKl7GsVB4rIN8R1Vsrc=;
        b=JR+bWkRJ2gzo5zWbUMmqwikN+Xj2keZDl3UDnDDlp0Peyv/jVcPBOY9VRzfFNxvvwP
         Ak8wJP6+fySKm8BYdAhRsw6NeTkTHcu9NQDGyifmYSKKUChEHZA6eWUBhmGinnMGULYI
         Bek7Yba+vvc3YgYAEV1QoqJw4x9sWP6ODr0Tewy6VYS+A6AsPxQIj4lkndkWwM/OGDf8
         09yS6yJFsB3IDYtVnqzTB5BtlWD60hcoTJ94U9jj18ksyKRXO14GkC8WobPa4WEB/FFP
         3F+XlGC6uLHyAIZwosP7o889f6qSbWxBN7Qf+UJI2IxQr7P1P4dLuQJ4aifdxsaXyUkm
         NJbw==
X-Forwarded-Encrypted: i=1; AJvYcCWwJZIMv6ebj9ahcTSI4ZAP5wVDATZY3rk4xuIoqJru3JxO+VDouWMpBkNly4+LxQHfYiCLzLZEPblhqbR/@vger.kernel.org
X-Gm-Message-State: AOJu0YwmfqW8aOkZ9AIby0cxH83h9L0PzWk+txRS3maJNNMx7DI0mmOP
	c4CsNjiHWg2WG2YycGcIsYtF2VIUVRM70GXA6hpyihAngmrobsY+oDVYTvryHzLc41llo00YLps
	zDHyfvs3PetmB/ThUz6kvjZvh/X6Y4Dz5MsJmPkIb4UJh99NqApVr1Mh+nxOTAdjmW3dO
X-Gm-Gg: AZuq6aJhYGgRtY4QyzZf7lht9e+IClAVL5s08/WI4jaQCWuFmL938U/R8/DXGZaXVDT
	kn3X3E4YpngBo3kPIzMqyE0q7TOGif5wzwc9dJBIbWEr4i7M2wbj/LosSn61iWDw8UVE7AcOfNz
	7aA00hOvfGioH99jB7cOc1ceT4W2NPlvzoxGKEsiRnwYKa9y+wmVaN8GabVzyjvqFj1l4Xst5jR
	5SWsEwoy9znTg5yT/VScQKnrjtd2jeZ8wtD0PIIcDCC45DHcmcM6cgg+Dk8mlmvMAPl44SHxZlZ
	Ut1Re+u4uOHu4RaI5pZIcSx9vUKxLoFMjup0sDki5wGxa5TTWMGhoM5NN4nPiGNNUsMnS/XOZHT
	ZhkAtRXT7fXWIrxRDiVZGapicWjukbD8LuLdgLnKPzlJVDlTXPptScXFLfJwABNf4Uq6mgEp8DC
	a9KgZnY+lnBDoWSavi1z7EIxBTI04/8Cb3dRQ=
X-Received: by 2002:a05:620a:44ca:b0:8b2:dabe:de32 with SMTP id af79cd13be357-8cb8ca63e8emr924601885a.42.1771809418848;
        Sun, 22 Feb 2026 17:16:58 -0800 (PST)
X-Received: by 2002:a05:620a:44ca:b0:8b2:dabe:de32 with SMTP id af79cd13be357-8cb8ca63e8emr924599285a.42.1771809418378;
        Sun, 22 Feb 2026 17:16:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7a860d8sm11389151fa.32.2026.02.22.17.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 17:16:57 -0800 (PST)
Date: Mon, 23 Feb 2026 03:16:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: webgeek1234@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sm8550: add cpu OPP table with
 DDR, LLCC & L3 bandwidths
Message-ID: <ukixjackfe3g6oz6gb7m5oae3i6wz6czycsxfjjphzgdirvvwf@w3ogubzwusxk>
References: <20260219-sm8550-ddr-bw-scaling-v3-0-75c19152e921@gmail.com>
 <20260219-sm8550-ddr-bw-scaling-v3-2-75c19152e921@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219-sm8550-ddr-bw-scaling-v3-2-75c19152e921@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDAwOSBTYWx0ZWRfX9IKCCx+XXd3y
 x2GL4MDsrix4CTKPUSJliRgLhcwChRlRNZDADNNGn5F/TaBVbSaWD9octctri1Mna6xSmhoByy9
 cQT91E6X4UJ8+cU4znq+Y2PiRPhXB7dDS34YRbi49FgrEIhYdeDBPo6H1ebntwtqrDl9aVqzcAV
 vZghjuPXvt9YJ12yYr+kzxEZk1xlObXJx0VW1mqzDWS8w7oHVnjOcJfHVzuN2d/6zqpLPWYHNw1
 tL0feGZUQJNrT2JQKv8k0+lh71CwRZpthQPNO3hEy9aLKkYrYx9w+6+YoeKSXHBfezF7o3RkVzf
 mzbQ3IGQ4AS8NnZnDuJQ2zwvlly4dmsX/5tscYMUPs3exZ8O1nTkCnbIO1F2FK8ZdwRqU7/4erE
 yKxqfXPKYsn7ERtEnzFBCPrUJ0gLtdjH+NgYy2ee2dFWJx60NVUYjWXdu2LKyb/zepVCXUcQdXm
 z8Af4E06vH3sB35Z/Hw==
X-Authority-Analysis: v=2.4 cv=UO/Q3Sfy c=1 sm=1 tr=0 ts=699baa8b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ze5Wrr8Eh6wvvEUSacsA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 0qXQFxegGwHa37qGfUhNcA37ykGMmiCc
X-Proofpoint-ORIG-GUID: 0qXQFxegGwHa37qGfUhNcA37ykGMmiCc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230009
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93569-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9A8CA1714A9
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 10:07:40PM -0600, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> Add the OPP tables for each CPU clusters (cpu0-1-2, cpu3-4-5-6 & cpu7)
> to permit scaling the Last Level Cache Controller (LLCC), DDR and L3 cache
> frequency by aggregating bandwidth requests of all CPU core with referenc
> to the current OPP they are configured in by the LMH/EPSS hardware.
> 
> The effect is a proper caches & DDR frequency scaling when CPU cores
> changes frequency.
> 
> The OPP tables were built using the downstream memlat ddr, llcc & l3
> tables for each cluster types with the actual EPSS cpufreq LUT tables
> from running a QCS8550 device.
> 
> Also add the OSC L3 Cache controller node.
> 
> Also add the interconnect entry for each cpu, with 3 different paths:
> - CPU to Last Level Cache Controller (LLCC)
> - Last Level Cache Controller (LLCC) to DDR
> - L3 Cache from CPU to DDR interface
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 367 +++++++++++++++++++++++++++++++++++
>  1 file changed, 367 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

