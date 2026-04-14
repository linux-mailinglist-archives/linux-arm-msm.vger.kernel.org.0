Return-Path: <linux-arm-msm+bounces-103205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id es0ONB+C3ml9FQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 20:06:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA01F3FD71C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 20:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F9D130457C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B6C0313298;
	Tue, 14 Apr 2026 18:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jRd+2pRh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ALrKxw2/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC602874FB
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 18:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776189973; cv=none; b=jD1/DwRKNvomibonMNlP6+HBqbLqpAT5ZMhP5V7BbSvJdFiSdiin8uTiw47w7mmhZFtrU72gqWyCymFVcBGaX7/S5ljfiOqZdByvajdDe1umS4g2DU+5oG/k0o66aXRfIcBPcjcKN9X1zbZyXEUYmggLpJjlG8VtNTqkdZGAuYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776189973; c=relaxed/simple;
	bh=u0nBbHBSgjgnpe0KFQwkgqOiRW+nhJjU3Glx/mx3NIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MVkzG3PX49aF8N7v1HEZOAMYiIM9U7NA8LYY8cElwxPky4V24mQvPRvmvuqzbC9fy2EA1R0jQFVcyXtoqRhL+y919Rh6YwpsqL0QgUVgXT4CO4bqF5gmJqeBO4mkdZ3s/bhuqq5MFL1AvVlOXQew+W1/QrmGzgRmxEVOkQXyzB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jRd+2pRh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ALrKxw2/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EHbYAX1701741
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 18:06:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Dwwpn3xcC7HL7EEDhxm6tbO+
	H/72am+MUaSViegCrSE=; b=jRd+2pRhRjy7HPPZo2mULsoIQ1BC1PLGeFqaG/LH
	9u88tPjcO9AywCudlu0GI5VjdFNtfo7ow8Xg32/OArVIoA5FgirDVqtv3YeMVuhq
	uAf4GKDbQATbNdC/qa039pHddjx3SNE+Scy/8rGHzI1ieXxuR0aEWazYq1NEfJ/z
	C01EPd9FL7ArNuOcDiomkYUFnPB695QINuJVjUTuOjeB51BzjjwbjGC7xLeJTJt6
	v5IbZg5nR7nNBM0P4Eak1G4EtfqQnB+Evyzq0V+KLMenGRTimPgwqj37CsPfT0zk
	KfGE6dJZFWbyKMeNhrvm6vZS6wZolCzOL8eKbwz6OCMsyQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dht56r3tp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 18:06:11 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6101726c594so1212369137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776189970; x=1776794770; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dwwpn3xcC7HL7EEDhxm6tbO+H/72am+MUaSViegCrSE=;
        b=ALrKxw2/SuivKZMNeN1PhNT2yS5HNVggQki1X2v3D8xpiGOnhf3OqHHv6dNZ+yAxnZ
         XfD3bmxpNsWuwru0p9NlD5mxzZJGdvje4NXQJAmdrQVUvIx6+cVLBl9p8ELmjc4Tmogj
         7HgCTxmoEfegs/k3PD+iM/zLb5foXbm30TmGNZxZa459lzfE3jfMbRavLE7Ee6GlezqY
         WjB99VGKJQwNIPO6y7f+RRkrrml3ayI3n5O2O44YU0JMZMGYPoCrnOnszf0VIZkIjGpt
         S3dyNjb4aj27eRdxE5ZjBU+RiWCFvlp+Nr8ykwkaqgP3+90zzFabX7H/d/2iyWWmniUR
         ++IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776189970; x=1776794770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dwwpn3xcC7HL7EEDhxm6tbO+H/72am+MUaSViegCrSE=;
        b=TdUFQmb444GsETXQ6bqVIUiLng47F8D27H5418nBc6i1UqHh8r3o8jWwrSWaBdTdqD
         VkbkKEYCAM99nTY9vAd0R3gk1jU5gSLac4vkaTuGg9sUO6GiACmX3zhm3QnieLk8nG2y
         tKbNfNYwh1lKuKQkbiYPJFghW20iVHYzORyEmFgf1TbR4xsKXpUSkTwiDXGjUJ+dVEU3
         NkblW+cQVTKrodw87aZN4p8YKmYf148fnxckfbfdRbff2Efb+5FP4qqRupWvoKOPQPgt
         +gHmxvlLNqW9pFpZl6wZGKx7g4m0FCgjocn9qv8Hc0+/ijPnUvq0gWQjNLLrVEGqzREZ
         +50Q==
X-Forwarded-Encrypted: i=1; AFNElJ9AqgGSDpbOoH1ekZFLCfczq1vD89707vX8yg87/lCw+8jtGlpx1CXq4OpDRB/12PKOjvl3kx/zUXvcWCEZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzqjQEGCEPbJF8+YbiuF1tACVmoP0ryaYmrKUV+2R80d4SyhFI8
	0gP6f0FUzh5y+UY22bYWGf1lRRy4C0BUxkBdyvV8nq7IVQESWliKWYHLuU/xrNScu23d6aj0+AN
	1kfyHzaM4vAulCynMzN9V1taXsDHG4hup0kfUKL54wmHDdUxLPr+5l3HpNEUo5QHyV+lP
X-Gm-Gg: AeBDietLWSVq7eZfwK/aCovO+Gc1MS2v6o8gsZX2aWql22T5fD95UV0g4g3nSM45psq
	L2Xysax6rb+KUfJJ47AaVbPZKpJ44/jlNCvebmnjBPxaD97gIKeLrKvmyumrIMqH1ej/mqy9BRA
	dOAGJpNF4nJ6c9uBpXhlyO30aVdKf2AtRHK5C4+TVPms+E8Q1ptkyM01OZnqi/UH9g8Ymut+COy
	uGvwvnbuPxM55UtPMGTzRfCksPm1AxougtTiLMB8z7SL2BWZuPfRDzYDNmM5x8VYIEu3LUMPq76
	8ETj0dzrmSllIItQNOfS6uWWAJSD2dH5ECFHFOtyBfcTi1SCGCcF0B/W4eca28C8qPY9l+Ut/Gy
	FVZPP5mOMATFqTlqqiXWG9AshsTqXTWZ3g6CxlRIruxCynfIXKijtWtB4l/DjW0IGxdHNnvPHhi
	ZsjKmHXUCheVICjS/CjIQGabPwgbBshZk5u/8hA8HckzG4Fg==
X-Received: by 2002:a05:6102:3f8f:b0:605:7a45:c7c0 with SMTP id ada2fe7eead31-609ff3cc421mr8308485137.13.1776189970301;
        Tue, 14 Apr 2026 11:06:10 -0700 (PDT)
X-Received: by 2002:a05:6102:3f8f:b0:605:7a45:c7c0 with SMTP id ada2fe7eead31-609ff3cc421mr8308433137.13.1776189969815;
        Tue, 14 Apr 2026 11:06:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3ffd12014sm1259084e87.41.2026.04.14.11.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 11:06:08 -0700 (PDT)
Date: Tue, 14 Apr 2026 21:06:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 06/35] irqchip/qcom-pdc: Use FIELD_GET() to extract bank
 index and bit position
Message-ID: <mmwpjx6fx2zk7q6f6wxwjjkrwjx7wjtumxyax3zn2r53xkd7hx@v7rjsql3w4oj>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <20260410184124.1068210-7-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410184124.1068210-7-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 35vSJup-tlOMwxKl7_sCq_ayMW6qSt2X
X-Proofpoint-GUID: 35vSJup-tlOMwxKl7_sCq_ayMW6qSt2X
X-Authority-Analysis: v=2.4 cv=K9gS2SWI c=1 sm=1 tr=0 ts=69de8213 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=nvp9pzcbjGLdG12YRgkA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2OSBTYWx0ZWRfX2U4XLUWuRUg9
 d2htElFq++8lbfOwHg8x/mlqogDfQOhEvyfn52IY/hLLydJLvp3wKjSl1Jfhp5r38yYrSKfU9/0
 K/qDnfEcSoPIyH8nFKPkngjcqP75P+ipqJOL8qQ4aIozRPNIHPPOxzFt2czfI1xK1R+Ngg3Ovjq
 ti1R3xGt348tKheQwA/oZy8ydhj6bOALasTscLImBs9OvItWrcbIA6VGPduoo8B/NFGUTIHHKaA
 ISrOtcL9yQvfHABaEwqV3ZpS/D4nIWEUqt1E1ZuCxWuSJd9OyFoe8Nuhm0WDEAJt+togmBALDkF
 oBZGzeRzbmdnZvSqmJ2teJkGyXhBdFVpWW0zgogonlkan0n2Te8WqXuUIarq+kRXNVaS3eCr1HU
 75K9ugdakvCdhyzKhxTh3WykYmNzPMvzJCm6nbN1GAAQ4QOe5onSBYhwT2JJL5semXWiqyZde3F
 oIqhPcsv21ZI1Dnocnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140169
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103205-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AA01F3FD71C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 11, 2026 at 12:10:43AM +0530, Mukesh Ojha wrote:
> The IRQ_ENABLE_BANK register is a bank of 32-bit words where each bit
> represents one PDC pin. The bank index and bit position within the bank
> are encoded in the flat pin number as bits [31:5] and [4:0] respectively.
> 
> Replace the open-coded division and modulo with FIELD_GET() and GENMASK()
> to make the bit extraction self-documenting and consistent with the
> FIELD_PREP() style already used in the PDC_VERSION() macro.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/irqchip/qcom-pdc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> index 5e1553334103..638b5d89a141 100644
> --- a/drivers/irqchip/qcom-pdc.c
> +++ b/drivers/irqchip/qcom-pdc.c
> @@ -110,8 +110,8 @@ static void pdc_enable_intr_bank(int pin_out, bool on)
>  	unsigned long enable;
>  	u32 index, mask;
>  
> -	index = pin_out / 32;
> -	mask = pin_out % 32;
> +	index = FIELD_GET(GENMASK(31, 5), pin_out);

#define masks

> +	mask = FIELD_GET(GENMASK(4, 0), pin_out);
>  
>  	enable = pdc_reg_read(IRQ_ENABLE_BANK, index);
>  	__assign_bit(mask, &enable, on);
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

