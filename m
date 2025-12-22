Return-Path: <linux-arm-msm+bounces-86200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A831CD5878
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 11:19:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57C593015EE4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4257337102;
	Mon, 22 Dec 2025 10:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S4OuRlQ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CoZ4ToKi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164D43370EA
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398761; cv=none; b=XdTRMDon01ZWRYyziVHSg4kFA+jpqImKaRb43T47KYWdEH192F/miVX/KOoJiigVTaVf90G5CYAOxI/QecUgHp6vu1D3mjfHaj0Hv8cD7ti0e3gfQcBmmBOZcn47gXetTiub7KEXhuevKr8Rf7t7X5xpd56m9Ii+UrIERXZ0Nik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398761; c=relaxed/simple;
	bh=VRAY1JBsyzbUa7+i5+3R/KjvZyuZRKwtLOmHcHqT5zg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sD9WuRAAHpA/wmmWSFRcMBZStnFbaTtFI8NZXMnyjy62k1EKAyzUJ1WBdnUT5lgjgMc+5dsS+WjES2wJMEOCuTG9A11GAUw7WqHc6gVsEul2/2u0wVdCnb97iIOKFInplmms6Aw5S+xIi54UTkGu9xBMLg1UgY763yMuWdc/4Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S4OuRlQ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CoZ4ToKi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM9YoDX1603483
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LUTq3ggrBqFfZJlGq9yjwOSaf+F7Ej3hj/HcEnNQ6SQ=; b=S4OuRlQ/ZsadcW51
	wA7sYqB9b/01i5kE1PGZwYBo7WwE2/QWdJuW0RBxg9KCSQNGIjxI4re2HlPGmgIS
	0YhOdO3bl1vu/FXxx/xVPqbH2fS45kSEeAJaT33cQanxd7fCiWjyZUV/JmKSgF41
	n0AJq3RT1bnshp9Bdj6hh7GqWPqmWqvQk/guJrcXMqdte2rc/gk2Y9Tmm7pSKzGh
	Ib5En+eyHhuLGRii61dRGkJWPRaAlC2WDEKjizVOtNz2E9CZ/eOzkexsmBvpkM2J
	puujciCyDA0SZMTxRtynX/4eHuTm2tuUXBAF7TN1zvCQ8NiyvDGP6fa9muFVwOXR
	i5meQQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b73fwr4jq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:19:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2fd6ec16aso92165285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 02:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766398758; x=1767003558; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LUTq3ggrBqFfZJlGq9yjwOSaf+F7Ej3hj/HcEnNQ6SQ=;
        b=CoZ4ToKirZi/c3lFZWsxTnBdYUTJtVD6r+turY8fcki0XP+KunZe7fEBsLjLV4ClE2
         HeUn6Kdsp8/LLnZltmEdADiqkgtfLByHkBsKdPUNCyuUBiLHqUwuaRvEj7W30lXDCPvl
         lLBUld+NsJ+B6ja+SLT7ccD+cOc2WkQ2iCcIGoQ7jP3YkBHmQG67Qqf1OCpcvQz+/GBN
         XCLqw/kDbd8wPXPONKiBHfbiAfYQV1x1O2Ed/dkHqfWN46z1yVst+vTuT2UvvSesqOel
         8gOQdLNW4jQtVJphtAHhQ5tBNPb9+WabthT00MQG/I2CPyL/TMmoP3mYzVPjNNSMq1Yy
         eE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766398758; x=1767003558;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LUTq3ggrBqFfZJlGq9yjwOSaf+F7Ej3hj/HcEnNQ6SQ=;
        b=u/gNZimsI71mXgO6iPNunxnqBy6SmEtliu/WNJU0Sauv/ViDLSpvCbTvrEk1JXoFLl
         xQZrrJq7VxlUqG/Dg0mU7PCyKgiUF/Jm89PsC7J05rUXQ4HWMsK2V/SoG+APX5wzXexm
         s/7xBBYheQpscVajmQWRmfrdPNyy92czGZ2lc/RMuxf+C0RHzugNRUuJ5GHlmLDTWNKZ
         mU0WrlkzEps2NWMhhr61o3FuCCfnE1kfDfy/GMSFX9yPOiwrHN6Ok9mAULk4UB5KuKOF
         CNX99s1dKYYDn4zfrWDSl+XpBaTtFXHKHxoetXqJKy+EZdXlOSErrf7a0EGA496m46E3
         Nl6A==
X-Forwarded-Encrypted: i=1; AJvYcCV/FsJdw/KQS1/bpOcV+QK5lJhl6H9wZB6VsTC1tdAwfHESGAzDSapIfR7HOwV/WX3xVtaJ8xhtMaCB/s7v@vger.kernel.org
X-Gm-Message-State: AOJu0Yw88rBQBrD5oJHilfy75/hnzek6GCkU47FJMfZsNEGgtirRaDht
	DFCEWsMW8UPUsTXrIaLuEwFEv/Xbm2QSPAbXb9/0m/X6Q6FO88xeD5H9yaC4W9YcsHo5CzdJxjl
	ArAbuZEoSfV/GCNfwd2g4ta0JT38VKtmeAuDHP3A/AvtBVXP8SWroWDs1lwkukkJFnALj
X-Gm-Gg: AY/fxX5aYeoIqplDqyiHK2i2lJRXjn10/eLm/IC+8ndjmYiFAIvs/ygQk5WkRGISd/8
	60X9G63FRIl1IWEedib4JxsPZfglrTWYBb+KQ0W+pRhpGYRZkzVkIlbW9Sg1uPaOygrFucnTGMl
	fH3dUuXpZj4aqoB7gfLd7lAk9A9gqmGs+pBk8HAktnqkHzEketLPQydqBw/c3WlHEPBpaeRfPH9
	Z56b08QYDMF5nqfXM+OBkA73gc71EdH3LjfDB+9sfXFB+eyxE7hi/euLBd/WYULil/yQOf1O/+L
	k/G+F+zMpKmh8mzbIzqu7XMDSamAS0FEkY1y2EbW9OS341DU6/pEMm47ppO2XZUMJutovg0q+rf
	xQjBLa931WwMRrg98NIaPfWW362qRIS/d6m3YYY/gzr8Ulgrs9pa9AVyFPVi+YsLDGA==
X-Received: by 2002:ac8:5d07:0:b0:4ef:be12:7b28 with SMTP id d75a77b69052e-4f4b4600b59mr100718241cf.9.1766398758327;
        Mon, 22 Dec 2025 02:19:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCqPBLPUNP0VjGE4Mfb41jy44P5jdKMLuXCQX6YohTJW18W8qxY9YnVGhNWdnIl2BNdzFrPw==
X-Received: by 2002:ac8:5d07:0:b0:4ef:be12:7b28 with SMTP id d75a77b69052e-4f4b4600b59mr100718051cf.9.1766398757881;
        Mon, 22 Dec 2025 02:19:17 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0b7bcsm1077906766b.49.2025.12.22.02.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 02:19:17 -0800 (PST)
Message-ID: <95f8a16b-5f29-46d3-bb3e-f12b5d3e4fe2@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 11:19:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: lemans-evk: Enable secondary USB
 controller in host mode
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?=
 <j.ne@posteo.net>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pin-yen Lin <treapking@chromium.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com>
 <20251220063537.3639535-5-swati.agarwal@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251220063537.3639535-5-swati.agarwal@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ELgLElZC c=1 sm=1 tr=0 ts=69491b26 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XEuYRhZFooMHjHqTHxAA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5MyBTYWx0ZWRfX/gpdt90uy1II
 i2gJaZGZ7B98PoMjClGAiIayy+iqkzRfwJqNQ7b9bc1y6iQRQ05P/poqCGID4Vesmw/nE6J20K9
 d5gK4oQ/ueA5Fw4aGB0xY6m2sukrNg1sKTTb2aszEDo8t7RzNXXGamd4pmxwpNID0PM0kvdFQvz
 uwT5/431V/5AQDZkGHr/n3aEXsA93WnXogo1yRwW80lpsxw7pPO7VVA6MPPAyDdmsjJfU/Y1fo1
 v/wcvRLZDTh/vcmujmXtnjgt0qoRy8ykzKaaxptrYenlHyWoo+OpCqbrNw6RHdygzNrWT/ovqSk
 wO48Tpu9KDdPPcdrtPeGmmIwSw3e81Xr+yjh7Sdxa6QcAjN3fbV4nwXPxUYJKlEhyhbkJF3uv7y
 ll7A9BwHw08FYFYJBEyVbCyBwOSKkEwxkPUFGWlCqXN9KkuGtx20LnYELshgCE2HQ1tlXWKnO/o
 lnd/s4SYqFUd06Bo1Kg==
X-Proofpoint-GUID: SDFkFFGqS8sWVfKuI3eRDpahBr2t5424
X-Proofpoint-ORIG-GUID: SDFkFFGqS8sWVfKuI3eRDpahBr2t5424
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220093

On 12/20/25 7:35 AM, Swati Agarwal wrote:
> Enable secondary USB controller in host mode on lemans EVK Platform.
> 
> For secondary USB Typec port, there is a genesys USB HUB GL3590 having 4
> ports sitting in between SOC and HD3SS3220 Type-C port controller and SS
> lines run from the SoC through the hub to the Port controller. Mark the
> second USB controller as host only capable.
> 
> Add HD3SS3220 Type-C port controller along with Type-c connector for
> controlling vbus supply.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---

[...]

> +	connector-1 {
> +		compatible = "usb-c-connector";
> +		label = "USB1-Type-C";
> +		data-role = "host";
> +		power-role = "dual";
> +		try-power-role = "source";

Is this port actually capable of receiving power (i.e. won't that
fry the hub)?

[...]

> +			port@2 {
> +				reg = <2>;
> +
> +				usb1_ss_in: endpoint {
> +					remote-endpoint = <&usb_hub_3_1>;
> +				};
> +
> +			};

Stray \n above

[...]

> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				hd3ss3220_1_in_ep: endpoint {
> +					remote-endpoint = <&usb1_con_ss_ep>;
> +				};
> +			};
> +
> +		};

Stray \n above

[...]

> +				usb_hub_3_1: endpoint {
> +					remote-endpoint = <&usb1_ss_in>;
> +				};
> +			};
> +
> +		};

Stray \n above

Konrad

