Return-Path: <linux-arm-msm+bounces-84276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C84CA22FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 03:42:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7905E3012258
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 02:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 349E02F49EB;
	Thu,  4 Dec 2025 02:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EKgVqMzf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WM+pDU0/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7792586C2
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 02:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764816127; cv=none; b=Xilosf5OCKqq8+Q27xz2rsczkbDMQAzdsC6D9dr2zySM23zixwLa/kylzBdIR06H99av9OpvZSMgMm+GhzpCWybThcYEcU20dccJktG3xrRFvxKyUNLRpkXM8+J6gMX6IUcerUmtJxOHBQt9fcbMsUXnjVYXelJIz6BUV/eehpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764816127; c=relaxed/simple;
	bh=G3y7043f/pefn+snHig3k9wSMWlvGhBULmjcWL5NODY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iLJEqosIkcKvS/tp5sS6gbrQRb9N8Ty0/ybcqcXDMVijm33WVejCnbg+ya606dGBSfp/BBSnfex2W7EGTdfe63LOytOzAHfudrUU6nGh1rZXKY9ZeQqxUCsdp9HU5JbRiOUc3r1vRk2BfFxDZRbjHRmn4cJKUfWDtUSpB+FqVnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EKgVqMzf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WM+pDU0/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3GO57K2658586
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 02:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XnIfixoWkZ6z+8EkKXKCE7MUIYeg9jXrwarGIPs+v24=; b=EKgVqMzfc8eKP1Ya
	9T1j8+VbMhjkYfMjmfsRbxBgNAcLDDV/IiF/V82DrjdxQUWpD5ya4LU68qd2E43p
	QrElvlIMnHj4+LwG8bRHLlxvcP9CG17wbm9fkEt1SVSZbHclZJjx3Ok+kk3xfavw
	ze5WEEkZwwhuz5k1ZOsfuBjWZ3J9Q33fcUtYcXWpVW1pEqjPeaWfdMXXQTEmYw1/
	m1L0Q6nNvOnp4y3xnaUzLKqauZk1qxjeaNMMu4FS4cBx0v/F958d+cog3URsXi3t
	WMjdVyg+bEeIjIq5H30sJB4NmhFPeKzNnHrsfPyr5zD4STREfd15nAoGcK7mYL5s
	cBo4Lg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atrpphnx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 02:42:03 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7ba92341f38so413660b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 18:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764816123; x=1765420923; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XnIfixoWkZ6z+8EkKXKCE7MUIYeg9jXrwarGIPs+v24=;
        b=WM+pDU0/1j0PP9awCYw/8B4NQZl6d5bq8adh//9cVzj7QRW1Wtk7Xv2GJhH48SeQgY
         3ptLLv0tlVAn5Mm+6GGY1KE44+ttr4JLE0sbezob9kJ6pyQAcwyE04TF4xFE7JjtwOAj
         lvUYehcoz4zIZaZh/fKM1hrbiaDr0U0F3/IPzheo4FthAWjePgL9C1iB7EwOZUXOfR4c
         NsyNItnZG9AZWNtXZ9kf25zFu7pg5wN3faFbst2Ei3FQGSgwtvlZ+O+9+jVee/eM6qrD
         RQKTfbGcfVxWrt0YfRsRke1M7edkc4QvB4+asZXMdxMX+5f7PosHVNfOgeH0ZQn5EFSI
         Lmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764816123; x=1765420923;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XnIfixoWkZ6z+8EkKXKCE7MUIYeg9jXrwarGIPs+v24=;
        b=tqVBmMRvk3dokndmsJfmKRFezkC8027QtV0+uAWfUJbTI/MytaSbVqV/xo+wnceXXF
         cXSLkFKCEXDF939pPXbZXtJxAxetzh9JoOyNKr7J4jsInQj160KUaxQp5C5eMIXUQCCh
         pRGyeMUquPQlEkr7QATWxBIejmd5w/RpAcbR8FP5lYeXer0eQ6N2mdyJAh5JM9I+G/FR
         o3XSqkOGDtoSiVyy/2gOrghrwkgLrb8FW/G7HbfEJFdWIDC1jezt2d23KabtcM8O4HAm
         wSJf7VuRTZvnjjBxe6LJhyt7F7InAOPw3NOK2hNXxGv1HrF8s4fQw6G43h1UdeRo+dio
         sWiA==
X-Forwarded-Encrypted: i=1; AJvYcCVTwTdAMR6KcDp9YltxfVQWMQ68mX//OGZ+cGy4AX3bfJ9HU9P43GqOCPUp3eaMluw+f28XyamJKqsDx+aq@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4p05owSyiXGQH1CAtjQWph3VpMgM5gt2jPGyL5gHxIjx1drDH
	zHIG9X1PA13QkyJp6I9RJMooiOd/s9leWOMwKbsf4fgSOoxGzqAa2RWnCYa2PWcdwv5mutoskYt
	PnBqxfamadIzSMfI0WP71xd45l7k8XIn4osLw0fSKxBu1PwvJFuquyrula/SYoKnoFxmP
X-Gm-Gg: ASbGnctyg2d7nnrOlt3kQQL6zmYmJss0igVsR3Cn+XtRHre3kV09hh6DOCfSfmYHz5C
	pOZT+mcZZEkLQNoc2794o6m1SCrvu8RUd27yPVT+qsgW+Ix2reHgr5fzKbSnl4Ex++hkhLGkACa
	FcB9XmsILdFTQaRWP/uCqogksXAe5bdzp5lSkDER6/Fy98uQ4tItuBspt2xCSBhDDUZzozauM5I
	yVUMBqda/7G6ZycAB+LAeChHvbz2kda22eBKtUXzIy5Zn4zMYUpZvOU+VxFrQt9qoa+gSvSzrRA
	gplfgjO/9flMXyEQ60Mh0TSjq29iEMOnriHOdNq2IrQ3vuZYK3SROpQO2TwRXc7dTDIfI7u+MdL
	1sa/xBAvZtAFJ/trMlGep/33bqEsOERBCvPK92d9qEGOtp2twKhMJQWPz/316WT2VRH3kijwup2
	OX5i4h
X-Received: by 2002:a05:6300:50e:20b0:35d:1bcd:6887 with SMTP id adf61e73a8af0-364037913c3mr1250283637.16.1764816123185;
        Wed, 03 Dec 2025 18:42:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkjCBZ+HwFwhl2IHJxlyaFVTeQbel7/cmA2a9dg13knrcyfCDNzGezO4wskiuVmkavwz5GMQ==
X-Received: by 2002:a05:6300:50e:20b0:35d:1bcd:6887 with SMTP id adf61e73a8af0-364037913c3mr1250255637.16.1764816122714;
        Wed, 03 Dec 2025 18:42:02 -0800 (PST)
Received: from [10.133.33.104] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2a0533f08sm366922b3a.23.2025.12.03.18.41.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 18:42:02 -0800 (PST)
Message-ID: <3a6fc312-ceb0-4258-981e-e6017c1c9b20@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 10:41:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/20] arm64: dts: qcom: Introduce Kaanapali platform
 device tree
To: Pavel Machek <pavel@ucw.cz>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manish Pandey <manish.pandey@oss.qualcomm.com>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <aS8uJCnb0xOd6uby@duo.ucw.cz>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <aS8uJCnb0xOd6uby@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 72DD-VJhsa-H3zewiN1WZdF9H5AlgY9q
X-Proofpoint-GUID: 72DD-VJhsa-H3zewiN1WZdF9H5AlgY9q
X-Authority-Analysis: v=2.4 cv=L+YQguT8 c=1 sm=1 tr=0 ts=6930f4fb cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=ceeeK6f_PLj2YqPUjm8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAyMCBTYWx0ZWRfX8lJ2rOfc0ig8
 2hV7MHUY1lBO8MqEJHmrXd45gy1+9yvHxOkp52pNeiVNrBTovHbXogcJSUGkV7yNK19iE7nlp7x
 XtcPVGnxPV1fjhFbExQ6JGxbKSzqOanF7d/oavmgC70KP5Oia7AZAbFJEFA5zDhQzKQX9MP4BQg
 DNPm0jPowsUzJIccaNTdoNgmFe1thRCDEjcFkRFeUMcF42Zo0w+L0cTXbMJ7/fW5yaOUVziGydX
 fD+zEyfsUbBsds8PfMmRc843U5KRjyxiPdQv33d5wYajl3LJDZRqp1l8TuxPiIboWLaXdqzBQcp
 r+pEd4qKjQt97FpDsa3DXKevaY7f2aRVsWwi4BIUF9lI+41Edz/XOdaImEP6qSyioyBkfymDYd5
 n0IxWQWEkcMkoQwyZBo7LfCj66DnJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040020



On 12/3/2025 2:21 AM, Pavel Machek wrote:
> Hi!
> 
>> Introduce the Device Tree for the recently announced Snapdragon SoC from Qualcomm:
>> https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snapdragon-8-series-mobile-platforms/snapdragon-8-elite-gen-5
>>
>> Bindings and base Device Tree for the Kaanapali SoC, MTP (Mobile Test Platform)
>> and QRD (Qualcommm Reference Device) are splited in three:
>>
>> - 1-3: MTP board boot-to-shell with basic function.
>> - 4-16: More feature including PCIE, sdcard, usb, DSPs, PMIC related, tsense, bus, crypto etc. Add QRD board support.
>> - 17-20: Multimedia features including audio, video and camss.
> 
> Thanks for doing this. I assume there devices available with this are
> quite expensive/hard to get at this point?
> 
> Please cc phone-devel@vger.kernel.org with phone related patches.
> 
> Best regards,
> 								Pavel

Hi Pavel,

The cc list is generated by tools following the list in MAINTAINERS, you can get
this series from devicetree@vger.kernel.org or linux-arm-msm@vger.kernel.org

Thanks，
Jingyi

