Return-Path: <linux-arm-msm+bounces-85529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7635ECC84F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 15:57:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DBA4D3005F0B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 14:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AADDF3845BE;
	Wed, 17 Dec 2025 14:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GNkJswRu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ryugn08E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23163845A3
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 14:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765981748; cv=none; b=cppTvsO/hO54EZlUpkSOMvuLWyWtcD+/oEroY/zj/JfWx1sN/Y+hdmXj0W4LML2dcGeuXU0kry5Ib4clOslKb5cfikNfIuu0PMDX4mZ6WC68cGiyuaGe2OrkM2L17t03buT7EyaSjGmHIiaeHc40Joq8nrr396dqjfZ1327kCOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765981748; c=relaxed/simple;
	bh=ERok2CW7sypEcB+fTJ+rHSXjCVjmsMgp5MkJa7SgXlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u6Qw0VQGYpdOJeOPIwQQt2TQmZos1sVht54BkYdCdKtoPZgI6rIAMQt//ngcDEk+TKt85XJ3NhCo6zWn7luo9DOVG8lazPOQVifBYrWeQ2B7skSQrKAQV/SLxpM/UOrFMqUqqztfruqDFqkjQ3QU9aqhbUiaZD6vBEWHH3CMvbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GNkJswRu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ryugn08E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCL8Ad3204360
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 14:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GWnXXLZPwPcjYmJ6eTq9/Vxo
	0TPoq/BX97qxf52v9Gc=; b=GNkJswRuSJO8YOrhcZH5ViQhmmPlUTx1wZdL2JzO
	2zHRAgvQoAyrOWU/4pfCWyvZVw9mCbtmoOZ9HbSLh+Vp268RaIF2LPiu6W+slfHl
	XShiE1MaeTzwzXGpWbb1bt+5rLSrMvceqabLXdIthQljzNMZi4QAgM1TGA0xS3/4
	CzkZiRZc4nrA7f+gulEnKefpryeM1eWkN5joIOkI7yAwMXGKkM+5YbhLevEll3Ck
	uZ7BRCZ13KmcdIVHWBmauJFa3RBt+gYSMV2HDnNIYORfi6bOBtlLL2ZHPAYaNr4O
	gaEzUbqrhrpkjWWewtV+NcUuS8iTZ1X614Ol3CEHsy2sww==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3j39jbwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 14:29:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed74ab4172so122179251cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 06:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765981745; x=1766586545; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GWnXXLZPwPcjYmJ6eTq9/Vxo0TPoq/BX97qxf52v9Gc=;
        b=Ryugn08EElPS1mBSbr0s99v3hLt0QO8BNGAW88rF9eS3fwBAUqgaCLb77fWsu5dgKC
         efziWPTpz4/V0SlsyWjAhXAgBtGohh9UCWj/6Oof9QnHVWSdYaU9ELNfIuXJKJs3vAXv
         HQOUX6tXMG8HkOOCxR+ihq0OiMS31dbig3sbklJ7hcwz0Wfolp+0cidglQfT0nort6ce
         6o23Bf0b0BHlSL8teYA6Ba3ZDG0/H7hMBzdZqWwJgJnIXMJhyBp5caokYujTogJUocIA
         WKt3bp0UIRq4OXudcD2x3lvjq71iEpHkFlQXhT0tlS8E9tpYiZaAb++q/ZqFRIhYI20Y
         JZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765981745; x=1766586545;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GWnXXLZPwPcjYmJ6eTq9/Vxo0TPoq/BX97qxf52v9Gc=;
        b=RoPCxhm2AVbXR0UMX9fEakceLJ+d+XDTOTWmvZFo0wz/WiBWNXmIb0zo7WAYgX/Hyb
         I/idAamQjXvhVJhMCwQKTApGccknXoR58ZZXWV8PQNttsKHHkheZwe3WXa2EJARfdNVj
         IztK2xKbpKnOKNZp4YzwXmY4gsI1UKh6jX7XMYSGvqZxWTpeYZUgj1g5d54bNLs4yDCu
         cfMYXX8Plt7ga9FE99hMlg0KMLNzrfY81oqQugvD/MvA9xkmxweIcIxCmYspFB+MAewS
         ZAagoJikoAFqXDqRDgJe2RPki1QjxAboHMOdVHFbBlfEIo20ulkSXs7zXmxDxZmYp03q
         7vxg==
X-Forwarded-Encrypted: i=1; AJvYcCX2R/6pQQNXNCXEtKUYsCJOsMwb70ThveWNijWHf5ZzYCXuN+SLvwg0Gj6UqOt0GjZQjfyCWaNjqcbOxDWQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwJMszLRhVOcqTjyj/o4TW1FyRx4ijOoZ/NFTqjE0+qH/qK8qI1
	UjHRTLmBDUy4qMBR3+j0wzws4qFBiHe97Yad9afCFPhXLJ6++C/op3ELLuuCEVyaQZWug7mCbCo
	do5CbSJlv89nCqw/tjSCMtpws/RhlksRD4/g7eoC/NDq5DTCYfPxHKRRUx3fnUPsjTAdg
X-Gm-Gg: AY/fxX5prsWCzVeoZW52ujU2ZDYyBt+MkMYXTVzowWPLMLMogdfSn57JPPuzg8qwZGY
	l8SgdkKf+oificEV9zRNVxA3j8zZPIGcDHydl0lbv5K357szzas5B3sxr32g9/Vhnf0AA89bVqN
	TNZckGWz0cdl6ymCY8YKpnjZS87gi6chD/6JSmHV159G9EYmW/wUJDMYRwmX9tTK2GdvnRIp7mR
	TIg9LyTQWygFjYdJ/FOaT6M8zApmcrxajK0mcE4acb5b0zI5Ig8eSY3LxlIcjj/v3DljvDVWCe6
	frqUiTNnCkHg2CE9OzZJFgFHJiECK2U/nc8iZmpLnvCfVysayFk6oKgyz6+BfEiuitPoCn7Cvgc
	aQLDruka/dt/Uh6KMsc2EHF9cfgNhI90GAHbNZkd5OEYKaM71WTz2qqwctB+EzBRdBV+V5JNtjb
	gHHq8LA+XgFdPUwkE6nuZapLI=
X-Received: by 2002:a05:622a:2c1:b0:4ee:18e7:c4de with SMTP id d75a77b69052e-4f1d0622d74mr270978161cf.78.1765981745047;
        Wed, 17 Dec 2025 06:29:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHoDLIcQPG1FuC3FZZauVp7VVEdRE8p0W/nAUBeErKUh077HE+3CL82M3hNdbKfxiVebE0Aw==
X-Received: by 2002:a05:622a:2c1:b0:4ee:18e7:c4de with SMTP id d75a77b69052e-4f1d0622d74mr270977621cf.78.1765981744502;
        Wed, 17 Dec 2025 06:29:04 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990da1a4a1sm2429362e87.40.2025.12.17.06.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 06:29:03 -0800 (PST)
Date: Wed, 17 Dec 2025 16:29:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Kumar Sahu <vivesahu@qti.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] Bluetooth: hci_qca: QCC2072 enablement
Message-ID: <xv7zlaoymcuq5kirrgu3thp3trmbdry5maraz34v4tkekinyaf@wgrfk7ukiilk>
References: <20251217112850.520572-1-vivesahu@qti.qualcomm.com>
 <20251217112850.520572-2-vivesahu@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217112850.520572-2-vivesahu@qti.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDExMiBTYWx0ZWRfX0t9JYhK6DHjB
 VfZ4rBk7WDdDAzPVlO6N7Z6DUvswjmJ3fua0qGk9whbVPN0aY/cYmHE9oe3Bqt3khojIYl4ZnuJ
 UxyzjkW3zxmdP0/D1juw/iJkLTNSqXssw3+jHOplMP/oHiThxm5hgRGAh/u95bUORz8WZWyS9+L
 17ynFmDXaje2i9Kt/FQA9qHgTIwCQ/7rKLFGNOKYGqnYQpvnLY4dijB6Oq7YOwQmO5bB8cDwClw
 J7RvFXRRqHWtyI0rx4DAc1oyCKJuHuap8NMF/7G8/dqKh24dmjqkgcjIJzzY5d2Y5qs/OtxL7NB
 dFJSB/gHdH4XvUew8f/0P9wpto1ihJklR/s5PFq1s7/2cL+I+JOUzzU2oZSq92S+OvOp0GV9wwX
 AWoO/dsZ53xvIEyacbxKOUVZNNlP9g==
X-Proofpoint-ORIG-GUID: OxzDqJBoAdJv2b3zyA6QQ4bMjpbanRYM
X-Proofpoint-GUID: OxzDqJBoAdJv2b3zyA6QQ4bMjpbanRYM
X-Authority-Analysis: v=2.4 cv=ToXrRTXh c=1 sm=1 tr=0 ts=6942be31 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NUmHm4JO40cz2a15_LYA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170112

On Wed, Dec 17, 2025 at 04:58:50PM +0530, Vivek Kumar Sahu wrote:
> Adding support for BT SoC QCC2072.
> Set appropriate configurations for BT UART
> transport.

Read Documentation/process/submitting-patches.rst

> 
> Signed-off-by: Vivek Kumar Sahu <vivesahu@qti.qualcomm.com>
> ---
>  drivers/bluetooth/btqca.c   |  8 ++++++++
>  drivers/bluetooth/btqca.h   |  1 +
>  drivers/bluetooth/hci_qca.c | 17 +++++++++++++++++
>  3 files changed, 26 insertions(+)
> 
> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> index 7c958d6065be..7eb095db4a1d 100644
> --- a/drivers/bluetooth/btqca.c
> +++ b/drivers/bluetooth/btqca.c
> @@ -854,6 +854,10 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  			snprintf(config.fwname, sizeof(config.fwname),
>  				 "qca/hmtbtfw%02x.tlv", rom_ver);
>  			break;
> +		case QCA_QCC2072:

Please keep the file sorted. Find a correct place to insert your changes
rather than randomly sticking them to the end. This applies to _all_ the
changes you've made here.

> +			snprintf(config.fwname, sizeof(config.fwname),
> +				 "qca/ornbtfw%02x.tlv", rom_ver);

I hope to see the firmware being submitted to linux-firmware.

> +			break;
>  		default:
>  			snprintf(config.fwname, sizeof(config.fwname),
>  				 "qca/rampatch_%08x.bin", soc_ver);
> @@ -929,6 +933,10 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
>  				 "hmtnv", soc_type, ver, rom_ver, boardid);
>  			break;
> +		case QCA_QCC2072:
> +			snprintf(config.fwname, sizeof(config.fwname),
> +				 "qca/ornnv%02x.bin", rom_ver);

No board-specific NVMEM dumps?

> +			break;
>  		default:
>  			snprintf(config.fwname, sizeof(config.fwname),
>  				 "qca/nvm_%08x.bin", soc_ver);

-- 
With best wishes
Dmitry

