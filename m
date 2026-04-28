Return-Path: <linux-arm-msm+bounces-104981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4A2WHLSl8GlAWgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:19:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D98AA484B9F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D856731DB880
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 11:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 200143F65F9;
	Tue, 28 Apr 2026 11:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BHdeZn1Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BHgtB7Vr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA343F65E4
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777377305; cv=none; b=jfKXfhmqsWsnw4qMg5jDW/naZQU75JiSCpHDp4kkGlS3zceOIeBIddroNpaY2x4KZYVetI+/2mstXkzHtyBK5jkIto9sZC60iJBNfzBI+iRrrs+l5Zo4/gO56nBhRopb2cImt3zkP6cWlUwRHM4e76bvUMdhdAPdAI44nMX3m5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777377305; c=relaxed/simple;
	bh=5dJa+tGJRSBuI13nLl/GYz9NPVhY7r13IyAts1jqOo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qqt/D+WYDncJ+OeB5ETbpkw1340aAhVx+fBlj2J5IIg+Y32N0jpP7LbOh+SkiToBM8/SKoyV0OQ8Lzuh2VgLLQ7X2khDkiM4S80fB2luuK8aUfFoiZBdriZCRAhOoqhV1T1sS3kHZtPeeJ1q92lrBjhI/1BkE3qRjuEYI5QyPLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BHdeZn1Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BHgtB7Vr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SAaL5I2112680
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:55:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H09Zk0X4k8B+gAnXTVvs56d36dwNpYdV/aDUCW9XEzs=; b=BHdeZn1ZlOfzK2Lq
	SymdPaR0lAPQRP7+oYpY2dblSF9gH6++mORqqgfyi7xAyKsJrU7uOrOFXrIT9AzX
	7dfWAtquJQuex+Dv7dJdKnwcPRbcB7T4uVSQsRojzOZlX5cAsxYD8RLiELPegq6R
	LPY3afP2g6hYiTxteuV9SBa0VW2PFCdF+UUX59NMZF26Cq7pBT8KPmIAbzJsNbVs
	h0bvndziGPECkRZYIwYei7SCKnwlgwLrywv0LmiDycMQtR/jkt8M8+cQdL5+DT+v
	xf5MyRA89TxODVdxPceMg8lBZKZFmSCL8N6BF1Ogn3EKpNKl9I3nznDDEDuSFV2P
	kKnIAQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtdmbkbye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:55:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24e9b4d82so108442655ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 04:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777377302; x=1777982102; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H09Zk0X4k8B+gAnXTVvs56d36dwNpYdV/aDUCW9XEzs=;
        b=BHgtB7VrdeHPtevg6jFjYkwt9C/TVY9wWPgM4xQVHrz3y7FI1PLsA7BoHxtkac/gPZ
         AoEsXxpsz/hI2cAckd1X0EM/boINe3zrMridvSRNZwluSHOHVwFlFlaTGl89Pm3bIU5I
         IpSt+fGTIanfVGd/DXJHVPcJ9iVK4dn21yvgczudilnMPnjabkNhrPkKwNopGWBFgD20
         j86qrlu+aVzH7UxnetGskCzFEjPYQq3SZAn8y0UlbE7gkC1J1D57h28zBsWExsm0eijV
         9pdyZ7s0x2DGhcQ2UIr/Evy+CfWzCB3d5sxVbTesSerDTOnlE8+SW78Wc5sAM1PoUrRD
         aYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777377302; x=1777982102;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H09Zk0X4k8B+gAnXTVvs56d36dwNpYdV/aDUCW9XEzs=;
        b=rIxtr0crmUFFpZjqvRs78yas/KBwJvK59OQ8iUXsuZTcPaeC2NPoPLMJu5XFz4fdaq
         M2+iKPNXpnddHvlC3UPL2gyj+fiNQuwsF7JtMmjfFFS2s8B3ZqprVik7bUpfZ5nK7+kp
         K4iqXycTLt7SfjTHeSMDrmwVhf+EToOKseGpnuXVg05+Rp8f7Z94IVcUR7CBTa5vt6r/
         0gDSLAg9GrNyeBAUKNh4Xg1OcI6NvSF0SnJNl2rM3ptorOpeO9v3EJIlovdWOaor1HzW
         UVybXvYQf0LiuF85v5S4qEMAZdC9GZJXdWEcVzcCQ/aGab0WWv5FCH8/Ox1YEdYa7+Ue
         q91A==
X-Gm-Message-State: AOJu0YyifFCmyBFfMCF4uwHKuaucG8NQ5zoGq2nmg3HdK97cLiXym4Ea
	rwswqDpykvmDdIPs1fv/oNmuokKSU7FnNGUGCTny9WwpuBcEP3+l7+oicw4nfVw4kuIAcMgh/Aw
	G+lBInD+D6k1RCaeX6vYSBgGXGh1jYDmuJ81yvSWUSOQpqaZs9Sqgrix/ENBQat332MOB
X-Gm-Gg: AeBDietIFo9Wpd9+U2azfEG7k9q/Gl5AZsm1D0iAERvSewIfBam1Cw7ufkwDgGnLwha
	MQ83k8JiVqm2q5b3VvWN8QfhsEeOzYqatbAey4JRpmd1SzxDeS4f2C2nR4v8Ok7Jw3kUt+Q9kDw
	5F47fedXHQ3amtiukv5+AQIbVD/53BUFfm6RvWNVqlzxR3NrcnZ2pK46tm6Bg7Fh/zanh7r893H
	yn3w8X/66ODa2DY7XTCbjt/WnK5LIDNUl7l9JG2n0+QQf+ad9vlrGO3kE1zNgCEcY2WhbpHVzbD
	7cQeTYQhnex8puLroBuzbDKxRrCUXkJSgSEjUkPSx/ImGb7TodQ43kgwAfk2l4QPxkhhHrMjLDx
	NdnGL5BDpaf7eaB96FjfFkyHG2xOY9sUxoCSZI/lvCIRUt7KeBZfNwB4iCnKtCIhgHZdCSxW2xY
	IZ8xQJdNxqv4P5nyQVIwS5hWnRhFt9/NCYuPo9h42UIaJ6BWN2Zvs=
X-Received: by 2002:a17:903:2ec3:b0:2b0:6068:4c5f with SMTP id d9443c01a7336-2b97bd6b567mr24234785ad.8.1777377302216;
        Tue, 28 Apr 2026 04:55:02 -0700 (PDT)
X-Received: by 2002:a17:903:2ec3:b0:2b0:6068:4c5f with SMTP id d9443c01a7336-2b97bd6b567mr24234515ad.8.1777377301641;
        Tue, 28 Apr 2026 04:55:01 -0700 (PDT)
Received: from [10.190.200.117] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97ac7b35fsm24140165ad.46.2026.04.28.04.54.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 04:55:01 -0700 (PDT)
Message-ID: <9dd3aa94-0306-47ab-8bc8-ec5ac4219f31@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 17:24:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: add the TLMM driver for the Nord
 platforms
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20260427-nord-tlmm-v2-0-ade8e0f3d803@oss.qualcomm.com>
 <20260427-nord-tlmm-v2-2-ade8e0f3d803@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260427-nord-tlmm-v2-2-ade8e0f3d803@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KSTw_ubeV_k94zG0lMQxGKlTnCWP29Ha
X-Authority-Analysis: v=2.4 cv=PcrPQChd c=1 sm=1 tr=0 ts=69f0a016 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LJYSW8tzm8uOt92QnF4A:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: KSTw_ubeV_k94zG0lMQxGKlTnCWP29Ha
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwOSBTYWx0ZWRfX0M+hLzFmX8/T
 kiMwgWLX77yC4x0zb/8bXFMmMjOED6vum4Z4CQMUeDBjIXlU57Vb+ZWKEGMxhovYp6/+iRa5RMt
 3+p53PDTiYgpOYGTLKTiFM+rOywGCucQ9M9KpbeWUUPNqf9RjoXPykr9M7/LfuKKdH34ikRFEV+
 5nREej0WICLPCXLcYsk5A850lUEsN9Z3LmDI6urUMfWEJCpTd8zDc7DSzDgaVTNK+s9QfgaZz4Y
 HQkDdERImTPkJHj9k0tr30Hx0ekqdlbXmpjiwlOsLJTUMcYux9Bq3nGEW+70SF393mCqyhCuH3J
 SexXVNpBry0g/blYQbyydmRJc0EeDS1r3NWMslfuUjpuqFzq+9ypKfdt4HnMhwLDrY9U+sA0W+s
 e9moQj5G6uLYHGTzL2peSQXTnbPOh2t+tFXi+vicPf02jXCIWCDBpeutFkux247HNZTLSfyzvKe
 KD3VlqdhsAhpn0306kA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280109
X-Rspamd-Queue-Id: D98AA484B9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104981-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,arndb.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/27/2026 7:30 PM, Bartosz Golaszewski wrote:
> Add support for the TLMM controller on the Qualcomm Nord platform.
> 
> Co-developed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm    |    7 +
>  drivers/pinctrl/qcom/Makefile       |    1 +
>  drivers/pinctrl/qcom/pinctrl-nord.c | 2843 +++++++++++++++++++++++++++++++++++
>  3 files changed, 2851 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/Kconfig.msm b/drivers/pinctrl/qcom/Kconfig.msm
> index 836cdeca1006ff7ad5030ac5c537d775d3f0261b..67124ac607baa0f317e0713760a0a2fefba1e2de 100644
> --- a/drivers/pinctrl/qcom/Kconfig.msm
> +++ b/drivers/pinctrl/qcom/Kconfig.msm
> @@ -229,6 +229,13 @@ config PINCTRL_MSM8998
>  	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>  	  Qualcomm TLMM block found in the Qualcomm MSM8998 platform.
>  
> +config PINCTRL_NORD
> +	tristate "Qualcomm Technologies Inc NORD (SA8797p) pin controller driver"
> +	depends on ARM64 || COMPILE_TEST

+ default ARCH_QCOM
According to Krzysztof's patch,
https://lore.kernel.org/all/20260425155505.83688-2-krzysztof.kozlowski@oss.qualcomm.com/

> +	help
> +	  This is the pinctrl, pinmux and pinconf driver for the Qualcomm
> +	  TLMM block found on the Qualcomm NORD platforms.
> +
>  config PINCTRL_QCM2290
>  	tristate "Qualcomm QCM2290 pin controller driver"
>  	depends on ARM64 || COMPILE_TEST




