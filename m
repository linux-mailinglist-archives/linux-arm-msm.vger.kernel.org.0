Return-Path: <linux-arm-msm+bounces-86991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B819CE9F69
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 15:45:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AFA0230206AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 14:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A4352F6562;
	Tue, 30 Dec 2025 14:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="He7rLy+h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JO3NiR8/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B544A22A80D
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 14:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767105919; cv=none; b=MNlJ2+IiBPY7G7Tl/gABl+PM3jnRT9U03A5C5AJyNfVYrhcEbLtZjTYxroq6MvrIdZJFQL7jZ/pPMzhtK7I2roDVcQPidPQ6g1/dFdK36jTKrNQAfVYuTuBB5udI20IyEwqBY7xeOYJ12KyVaXNXhioyPaZW9dfZXGtQ/4SDdzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767105919; c=relaxed/simple;
	bh=T7BAmLXUjf1uy87Jyo2+C6BkNUzGNh0lWXw5PXqWxnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BGMlVYZS41wnqvLmXQ0/7cfh8iWgybeOAKTgz6NE4wbmglxTVxIgHOcrepg7PIqgaUe3cg7LtjU5MAgPswz8aAQaTkViBX2iMRQPtHlnflCUyIVVT+wCqX/RhbXK4aVlWSP9r8OSBYc9PmuBMFlkz31kgqOgMJxU6RUOo0Whk/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=He7rLy+h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JO3NiR8/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUENXSZ3539781
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 14:45:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D9gcAY3xkUnBdSvgGfDC+e/r/1odjoQKcBhgfdFxJyk=; b=He7rLy+hXltwq/UZ
	+qKUyZyd4OM6Nhx/oMAqrmBYzoy4UwR+RcM5d0rxYc4feRswpIQSRW7usgQ/8LRl
	2T4E/za+0hZ3DWcyHRe5BoiEHw+P3ZSwac/o70J23cHXF8U3//FHMp7nlHL2vy8Q
	QCavo9GI8mbtHXgZ+2kmDqwN2VpPCaw0zUatpG4xy2OpkFLZr0zQcl9XGVR5fMPU
	Wog72w9Z2Fcn1O7ntGNlpHQSsKrvHdzQKNVuPTy5qBehF/gsmWuBk+dS0uIqSxnH
	onFGuLS02LkY2MXZqTn5Zd1VySHfj9HN8NQFiPIMtOvQgWqdBnXre/K5dFe0dRW2
	3U5mhw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc88yh9yb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 14:45:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f34b9ab702so26305091cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 06:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767105914; x=1767710714; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D9gcAY3xkUnBdSvgGfDC+e/r/1odjoQKcBhgfdFxJyk=;
        b=JO3NiR8/DW/UUu1UHCeLVUimQ0ziRsRKBrED4o6EQEo/E9vSYuxC4nLf+Rf/PM3pk8
         N/iPA0F8AapmGKzyRcoKWC9jxh3ONpceiqjCUfir1B5Fh7frpKFsjY1qI7cnq/wuhCMH
         I0KesvlL7nVAlLUbeHrckzhi9Adaa+/ZeW4ZXJGhTaT/qRlJBCu7cLAroH4z/mj0jI73
         csi7LGrcVLWaxjy/gQTII/RSM46Q3vvKGcNtUETkPWYQGywQCmR4tcQGuvdYG4t1yO4E
         G+ms1C6TdRnf6vPlT/0AeD+/v5ntzq16xoDqHcuhLTfvShyqNEGWD2NpBqO116lxSr8a
         rEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767105914; x=1767710714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D9gcAY3xkUnBdSvgGfDC+e/r/1odjoQKcBhgfdFxJyk=;
        b=bHWbQmcTEBKso50CFhWdjeTCyXDqBxC22UM3WVV4VmhkzKpQLwtGhfeV9C2lMrptDE
         kXwhx0w5bXIWhmXTDqAYTd2FY9BHX1Un99w/fQDMAiR5VJYILxUF8qaGTJdqT9212uJH
         lAAPef5wlg0L9sgy9u/CUhGoLCk1tTJI15Z1Q4lpAvC2WEL/Tj7DzZeNq/4AXFYamTva
         CtRfXh7dwSdcWeFdT1YcyB5FuRq+N61qqItdECcHyhrelnIV1sS7LMrS/xsFbnG7mQLk
         b5ow+OF/+uvz0L7FocMFGQo6wsBtxt8K6bYy3CrpgZ1v944HiAOjKWd6EczHXCDng9dA
         FusQ==
X-Gm-Message-State: AOJu0YzbIbhRfinLygnNRRgd540SOywSIUbWCZZbTPCH2SaxeBLWMIoo
	OuzlZ42CiNZBrJrpe6dPz7b0seJ5Rigy7srSovoDeRxvugWoAsmwPovPckurcevDJHtaYKo4k4S
	8pJMPDrGHkKOgs1Ip2mScvFaeOz4FCDylnGusBOm8BjwPUpVZw4Lo2tDpCtuPK3t3hPhF
X-Gm-Gg: AY/fxX4VT3zKWNOxDWfN8/K+iUy1idyQ+tMFYUO4ibr/t86eW0ZQaZNUoPx5bvvXEyF
	D1MdyH1DDTMN+ZBkDwmNzrSEfOVgEH0/+KmaiWzTqtcKzjcsyyW8iLEvQhekgeznOw2oUNN1aNu
	ERZWyx+VCeYmWf2bJVgOM2un2UaG63I9hCc71/TCl+r9chvrNK3RIHLJ1arMWC6dX4CbeDemuWw
	8E5CRi0ixozVd+5+Xe6+nBoFQ3vlUMvhj6MeiPi4u34xb3soRUgC1NJ2p6urVGqOilq1W4fNxGC
	m0mF04Itbi/G4Ci1geQCgdUR0KH3DCG2eNUDBnc1Wm9LjkmM5AGj5KfDZYZhi3I82HKQkP1D+pI
	NduPM/Mo50x0tQ6MKAdM+RjoNyVpdjGZoDKhN5BIsbFv0ouzguhU0lAEXoKlCl8WRmg==
X-Received: by 2002:a05:622a:247:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4f4abce7d98mr387999711cf.4.1767105913631;
        Tue, 30 Dec 2025 06:45:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTdtbaDXDqhGK3D+EUcMxmH/wyNe1s7Fug/aEOy5Yg/4DH44Hv9jjvA72zDeJNORwMn7E+2Q==
X-Received: by 2002:a05:622a:247:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4f4abce7d98mr387999231cf.4.1767105913229;
        Tue, 30 Dec 2025 06:45:13 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0b7bcsm3793486566b.49.2025.12.30.06.45.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 06:45:12 -0800 (PST)
Message-ID: <6e2acece-9a79-4b3f-9a77-cdf45829db98@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 15:45:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: glymur: Enable Glymur CRD board
 support
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rajendra.nayak@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
References: <20251219-upstream_v3_glymur_introduction-v3-0-32271f1f685d@oss.qualcomm.com>
 <20251219-upstream_v3_glymur_introduction-v3-4-32271f1f685d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251219-upstream_v3_glymur_introduction-v3-4-32271f1f685d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=POcCOPqC c=1 sm=1 tr=0 ts=6953e57a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=j9TMeHSrmu6V3ep3hRYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: -j52rrzO_QH655FpJSgESCqVWX3gleBC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEzMiBTYWx0ZWRfX9sLG5oAbq0NU
 sPe6W+UBnE+ddA/VkePfN0uzrpf2BOgENWmeRwMHbSXbFbZrn4uECJewni9WrkGkqR/lAqRTxV4
 AmkSpIFr0T7rDR6wOjpDFDUiXuWrXSax4buUpPT3tHfPwPMB0L6AVnHw4IqgI9hV8O6m3Pf+90U
 Ew0Ego9JF7PWjUGAVgXw0IlvVkbba/ScWkVe60O7yXFfg+0//4RpgJYN3X4K4gNKbQudZ2FLR7D
 9M34IpeocmhXcQto1FRRCK02tTiWp6OkCPOkJbza/Et31X7CXd3O+gs2dQxuXGhSY6x0GtPJaRa
 pDaGIY5ItQi92/BHKVtxxArjbcITUdFC1o9YNg2+GZ31C05ZsAU+5+x7+v4ok3VwqZdgkq1ylvw
 ZBGhCznFGGcqDwCEnPEYe/Dpu7PUJmEFVevMp92+7maJm9CAgCTxovCI1QwoYd3ifyjZznwIOaE
 USv0A/GdUlt8jFiLgeg==
X-Proofpoint-GUID: -j52rrzO_QH655FpJSgESCqVWX3gleBC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300132

On 12/19/25 3:46 PM, Pankaj Patil wrote:
> Add initial device tree support for the Glymur Compute Reference
> Device(CRD) board, with this board dts glymur crd can boot to shell
> with rootfs on nvme and uart21 as serial console
> 
> Features enabled are:
> - Regulators 0 - 4
> - Power supplies and sideband signals (PERST, WAKE, CLKREQ) for
>   PCIe3b/4/5/6 controllers and PHYs
> - QUPv3 instances
> - PMIC thermal-zone updates

[...]

> +	vreg_nvme_sec: regulator-nvme-sec {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_NVME_SEC_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&pmh0110_f_e1_gpios 14 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&nvme_sec_reg_en>;
> +		pinctrl-names = "default";

This ordering is correct

> +	};
> +
> +	vreg_wlan: regulator-wlan {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_WLAN_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 94 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wlan_reg_en>;

This is not

> +	};
> +
> +	vreg_wwan: regulator-wwan {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_WWAN_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 246 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wwan_reg_en>;

And neither is this

Please unify them

> +	};
> +
> +	vph_pwr: regulator-vph-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +	};
> +
> +	thermal-zones {
> +		pmh0101-thermal {

Not a huge fan of this living here..

[...]

> +&pmh0101_gpios {
> +	key_vol_up_default: key-vol-up-default-state {
> +		pins = "gpio6";
> +		function = "normal";
> +		output-disable;
> +		bias-pull-up;
> +	};
> +};
> +
> +&pon_resin {
> +	linux,code = <KEY_VOLUMEDOWN>;
> +	status = "okay";
> +};
> +
> +&apps_rsc {

Please sort the label references alphabetically

Otherwise LGTM

Konrad

