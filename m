Return-Path: <linux-arm-msm+bounces-74609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D34B9A707
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 17:02:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 710EB7B8A04
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 14:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F0CA1D8E1A;
	Wed, 24 Sep 2025 14:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JHqFDs2Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36132E7BA0
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 14:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758725919; cv=none; b=iuHA+scXpiulPGZ4UXH9eDACQ+StUzX57IfXs5RkaitOEULet9oEPXj+835VczIIsIZ2e5tJaE0OCapcySFC1cFBf8JmNEooJ4f0amZ4pz6x0r+f9IUz5fkMYtfh08PaJ+XdHQQX+1gkfUZYXcP2Dz8cFTFnbWKmdLrolgaUkEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758725919; c=relaxed/simple;
	bh=EFbJNRh/Ngm7c+RzYEHsdjn7qb/A/5xbdXIsR9/BDQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ov2ztfX7XkYQ1jqGclDrPpZyOQUIXEfN3f3SrYVbD6TtdMwUSYODIpQk+LcSXMauRUj9eajW8ZsbXYmCoCC1cg6Yzn4FTxJPypJ0+N3/gTyAV2JLPDZCEI6WslqQJ5FtdF6rASTY8aUk6LBZ1r8jc6+vPV2lZ2LKV0mtcdBnD1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JHqFDs2Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCvxYY021502
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 14:58:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+rsdRuL83wzmCQbxZHI9FzvPIRGMl9WDxV6phTZSDEk=; b=JHqFDs2QkGr2UHxX
	xlaWkF8n9YP33i94PoW2mtNn3ntHhh4ro/khagcpY8P2OJqaY7odq3rxc1jno7Zm
	9UBr8AriNY5PnRHQRaCMrGrVn7mdKo9m01xspVgWYZBAuCadA3RNjqe+kADiivKv
	pvJMpgBIZyfTQYe4OhOs8Y5+kmVGSQIArY5Vyz3BnS/35yCnUJT9VZRAG5G2+w45
	sKjGx53CdZ2O55ELKfPsBgT3L3ptEVaJzZjun4wAedJ9B0WXm4QNfde+gIqs00nS
	9D6sE+4rPrWWj+WRBb1ekvbXcao6sGXA/JNhRhxLiYHfNl6wy0+Xx3WeAyCMohI5
	pKI5og==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budaca9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 14:58:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4d8c35f814eso1643771cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 07:58:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758725915; x=1759330715;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+rsdRuL83wzmCQbxZHI9FzvPIRGMl9WDxV6phTZSDEk=;
        b=S3vaqw5RcjXAHxTx2GtYh9M+34N6bgt1NMFj/ATututBpl2jFePD3deh6OlhY3kCZs
         EoGQf3lAvQabmnk7EZ9WKteCHRzR0d1qJQbxEqnL1xAo9RhoEF26YmcIiz3ulCvgq9Iy
         OXEzzDVqejxGN0nRtLKhxca9WXyn5YR4Gd6C5BCR7+ih8YmnUr2Xhlw7dt7gYTmkQxjS
         ZRoEDyMXQ1bbvEb7c3cOke9Z+UUV+Q094YF+75YmZlPg2PYFKYNaB7Gd7MVezflabDqp
         LSzsmEo7YmA+IpyrcD9uCuYdHU1tcmk8X96fxI+v9RKX8pEYDBQ/FTMu3/O1Hq+RiiwA
         OTXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQH/O6iyPcorvxub9FaIlEULZNfx1oM6zdKjfNLhLiMKfCp4V+IB/x4Rvs6SXIAZOzM8S0LTPHIX5pay4Z@vger.kernel.org
X-Gm-Message-State: AOJu0YzckKa9AnSaTmcC3hJjoUMfIZCJ2TWkNyVP2trFR+NakmCiUT+D
	+sjHpoIdsVVCRCnfH+E+z8K202wSIqqIPmZZKgZ6GQrChSZvs3KfPfWyqwI6BsIzp8XXg9aRjQp
	weG1PtucFfFtweCk42FFMDULmpLmM/UaRssalK1DQvy8Uj71f/vExELHhMALaCNVf+dALmEM6z7
	zl
X-Gm-Gg: ASbGncvoTKYopHv/fMFRwmk1IaSqBkeAxyDvh2veHX1k85nCjEt0kYtZ97zRC6ACQoC
	LcZ47LL3ERq2XhrDJ6DWyLKyx22c4NpwNv50e6s3enad4VZuIk9EtXN78/jFNc+cexYYscQ5wN7
	nHq+4gzf8Tox5tT5KSn5sXuCiMqBGBl+OYRc66u96zYyhllbjBgwzIepFkypcrUaKzgYCElSsUS
	aisjhJ51QuwvlasOrcSsaSNoM6UiGlsVbZ7RQQUsCJVXvdkw8K/u7a8jXvHzSQdumgX42q2qlP7
	/MUOvXGECChqID+fQ63HiyfFM7LM8ovWCMWUadL2aH0uN+D0z5x0tLrVIV9Y9gm17A4WuOMDPXz
	w4Z6zf3qKGyfMXkavsAwxOQ==
X-Received: by 2002:a05:622a:606:b0:4c4:6b67:ccec with SMTP id d75a77b69052e-4da488a0571mr614031cf.4.1758725915315;
        Wed, 24 Sep 2025 07:58:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHalVY8diM+XBZk2WNdjYGdqC5dPyvQbYzeJUYzrQmrlo8MkRfU3RHN0d56+4uGE+4nALG+A==
X-Received: by 2002:a05:622a:606:b0:4c4:6b67:ccec with SMTP id d75a77b69052e-4da488a0571mr613551cf.4.1758725914648;
        Wed, 24 Sep 2025 07:58:34 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd16c01b5sm1545510266b.93.2025.09.24.07.58.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 07:58:34 -0700 (PDT)
Message-ID: <660759fa-5a8d-4243-8bf9-49abb35d337a@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:58:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3 board
 dts
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: casey.connolly@linaro.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, christopher.obbard@linaro.org,
        loic.minier@oss.qualcomm.com, Roger Shimizu <rosh@debian.org>
References: <20250924121541.128582-1-hongyang.zhao@thundersoft.com>
 <175872544773.1675491.17859762973632380019.robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <175872544773.1675491.17859762973632380019.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3JWeMIDnlQVnEvlADXbPQyUhURUeUfbS
X-Proofpoint-ORIG-GUID: 3JWeMIDnlQVnEvlADXbPQyUhURUeUfbS
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d4071c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=Wdb1h0LgAAAA:8
 a=xNf9USuDAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=4CDoZJVVFqlZavh4jk8A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=j5gyrzqu0rbr1vhfHjzO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfX5voa64qJFqPv
 TcfpclHg2PyVI5ZDgpD+vlrWjMGJqqYk1GwGx17BThu0MI33wFq4+ZOsCvQtdjA5v3Wr215mpbW
 45ICrJUyko+16D25+Cz80Feajp6vmejkP5ptd4W5LYFhvqesDvcToqsxiy8KRgLy1ELvCjWxHzE
 b1GoTJZoPdY/lKu2rfyTgFhGof0WEY3Mwsxx3f/woG8smwUGvJ9HD/UgGJDdru1dausdBudUik1
 mTCzqu2MqHBxBWLhQnO4ZtOj9hdmHo18b7akcig21xKJwHdQNz5KRmlGQUHMOZSUQMnGrJAumNw
 fGHkXt1R9oulzsMcafv7ykmbjMYmxX3vWCAfvlplH3PPqYibyhHSPrWItM7+8Q+MsZFVEulws7y
 /Y0KFomE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113

On 9/24/25 4:51 PM, Rob Herring (Arm) wrote:
> 
> On Wed, 24 Sep 2025 20:15:41 +0800, Hongyang Zhao wrote:
>> From: hongyang-rp <hongyang.zhao@thundersoft.com>
>>
>> Add DTS for Thundercomm qcs6490-rubikpi3 board which uses
>> QCS6490 SoC.
>> This will add support for debug uart, usb-typec, wifi,
>> bluetooth, fan, m.2, i2c and uart on the 40-pin connector,
>> usb2.0, and some voltage regulators to the board.
>>
>> Signed-off-by: hongyang-rp <hongyang.zhao@thundersoft.com>
>> Reviewed-by: Roger Shimizu <rosh@debian.org>
>> Cc: Casey Connolly <casey.connolly@linaro.org>
>> Cc: Christopher Obbard <christopher.obbard@linaro.org>
>> Cc: Loic Minier V1<loic.minier@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Fix problems found when running device tree check.
>> - Enable USB2.0 interface.
>>
>> v1 Link: https://lore.kernel.org/linux-arm-msm/20250923064330.518784-1-hongyang.zhao@thundersoft.com/
>> ---
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile             |    1 +
>>  .../dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 1348 +++++++++++++++++
>>  2 files changed, 1349 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
>>
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>   pip3 install dtschema --upgrade
> 
> 
> This patch series was applied (using b4) to base:
>  Base: attempting to guess base-commit...
>  Base: tags/next-20250923 (exact match)
> 
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
> 
> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250924121541.128582-1-hongyang.zhao@thundersoft.com:
> 
> Error: arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts:1026.1-12 Label or path usb_1_dwc3 not found
> Error: arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts:1059.1-12 Label or path usb_2_dwc3 not found

Hongyang, you must rebase on linux-next/master

Konrad

