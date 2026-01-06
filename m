Return-Path: <linux-arm-msm+bounces-87743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D14CFA47D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 19:48:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 33D473058793
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 18:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 954D23502AA;
	Tue,  6 Jan 2026 18:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m2ftelMR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LE5Iqfqu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0679334FF75
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 18:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767724853; cv=none; b=h5lWbEp2kljYhfKVMJCzV8CzsehSjkOLeFBPLp/g+mlE2JntACvzX+V73FeOXRQTOCYzEm0hhLmLIHXRlqGHX+djOWC9K9GjOXUq52K+XwJ964sTq54Nz+aFKulZCbaGVG2kF6mhj2TaLuFvtNOPVICbzviDYES5XINuXojUPPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767724853; c=relaxed/simple;
	bh=++DQGKnOZXg8YlFGgSsaTnIuRLTvbA/gdMLcbw0EMEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=agbk3kugw3cyXPxK1CFNGkP5uw1VTzi/AI4uM7ZfUbWwG027Mw9RAUVzsjCSugxiRnRsWjGp4UJPcKDoWOWBOdUJBz8IhTLz0otBUQeC86kuVj4/0evcYUYk+oEoiZJ7iwp2w8CoB/J8f61Wxg2aKYnU7j9K6NrjkG3N1NIVb+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m2ftelMR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LE5Iqfqu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606Hk4Tr266137
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 18:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5PxAPouMyA//31qIYJm+rklBoskPqlYIqSfK+Bd0RZ4=; b=m2ftelMRML/dFZvl
	ht2KIE6bYMfPbyV+j9Wm/WIqiBh6MuAaKMwUl8CnHzk5AkFvA4SoSohfNPfa2Thh
	rKDkMYCx7+vWS3QqsTbmHquAoIaMnj4mYeErzGEsa21OpVVSSpd8XxNyIDaMj97Y
	OfUdQpMIiQl7mwyVJJoTHH1ie+a9iYnVx1WDBAN/epH8rjuEYuW9saUtbPkOjkMP
	qdhrU14zP+6bTKqifZw54iBJIqOBtJ3wzyx6dBm5zk7ERYJzQ1L4DFu2/ZCGWvNc
	holB8CgEM6ZSAatXT2br+vup262IRixQILXlE82dV+3d7CVY4NxwUIgLGcSXcaK4
	fPohzw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh736r5h7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 18:40:50 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12055b90b7bso2460022c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 10:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767724850; x=1768329650; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5PxAPouMyA//31qIYJm+rklBoskPqlYIqSfK+Bd0RZ4=;
        b=LE5Iqfqu3CvAz97I/A/aVD5ymgxZ4fL8E1s+h9fW+nm9Sgq437VGjm21QTVjfbIk8q
         KhmF8jkzM09zCbA8GqAn44mI32X+NU4oIL4J8d5cXXWAvXzhYFSH5K5/qrVGPFenTBVE
         BvXwbHJCofprgHxyfZ9dZcpTKPKnPHaQgdMSIlIy/zha/biEIgrCW1LGHhiNLivFmkiw
         6ba0RYB5kU9GqOKrnWEwY6USNnk6TXUFXJcUs21pOlvZyWuujqrhMsP22dwQQ+4x7nCl
         7uD4OW3flv0DeYZKl/BD+gThuy6eBUiywvlA8JDxvQUVZ/erxW9pMAGFHmHPhRsSg7UK
         W6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767724850; x=1768329650;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5PxAPouMyA//31qIYJm+rklBoskPqlYIqSfK+Bd0RZ4=;
        b=qu75h1o0KsIM21+PW1HVdS0/KXgZgzmO7aG+/VXtULvQCQA3Q6e+/d4fGZziGgjJeK
         2IWp9RSBKc1ZuH/49MVF6az1Zp/vXhSmJ5en1GSORz8i1ZvFFUFiQbOkQnLBxncZqRCE
         oGpKzhKwcbekUA6JUEuYBaDX02nox/Vr8BJC9G4KyridXw1S6yImHKsE0iYmb74lNRCh
         9x1KjugxnITVPylW3yuyMhCWsgYtYXm5z0pa6WmBSJSmx2n3sJv2e7nzTaZWouFOFxTg
         HENFSrn+AnAUD8FEcL+HfsILgwSmipXFQc6hjzRQAP/S3JGf9bx4B0QCG0FjYq/08ob2
         C0Lg==
X-Forwarded-Encrypted: i=1; AJvYcCXjvgr1yrmbxrw6wgArx7w11/R5Ox2+gBbUPIr2/NvGSnyRAhlvf8SxsQc5O2eqAIMdevcxOvGj2CjMsu6J@vger.kernel.org
X-Gm-Message-State: AOJu0YzY8eQGWqRU350Czaaf0jIndIhjNLNed5Wb2YxxoZiZJmHUlhxl
	9+EIuOUfgxzEnQojDLv08/mtwYSB4Q4RMCgPjUaTI6t24rr76PQQiLgaeRObvJekBCwKJpQINYm
	T4Lk9l0VwSZiIfxb9tHSQk28PouEuZbAocHZvDEKFPcNZf62ap+HtW+C4VhLH3yyA1nCA
X-Gm-Gg: AY/fxX5qjsG1SuARlPhly7lhS7Ya53i3Mn3fwpU0TrK7PHDMRYCZbkDA1Fv1KQZLzKO
	8crV7r6wmtERfRoj5L0T101wfzD5zx2uzyzO4lab9Nzl7pW/wMM4mOe8jssZdy9fgoOLlXBbBTL
	J350lcDLvRoByynNSKjP2k4ad0hbpiiqPzTDAn0MXdzxjwvO1zurT94LoDUPfbVwJbp2YM2w3WM
	Ah0fSRnful1CZT6WbRLqw/0+/lLDEwN7l3KgFcyOh2NihDdJBsdk6aKL3gKgziw/ZJRSfGYx5s/
	vyS88g+i5hnHNhsZGNOIKUW0wIse8/72bB9hRWgQXD9jU2Ijeb5hYOt9nfzzii9DA7c7dykLnXa
	agdEyVXySJEdPffuGc2LVgDHUYCJ9HqOGcNzQ1j6bmVBUvDtoECX1qFJLZ5AeCHs/oQ==
X-Received: by 2002:a05:7022:418a:b0:11e:70d8:5dbb with SMTP id a92af1059eb24-121f188e0a6mr3234842c88.7.1767724849565;
        Tue, 06 Jan 2026 10:40:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSlzX+i3g8MbsJ2Eno/vHUKFXWMpqLnsUNOpaetZ9ZfpcQ9g/t+UHkyP6dmuOdvPwPx2CiQA==
X-Received: by 2002:a05:7022:418a:b0:11e:70d8:5dbb with SMTP id a92af1059eb24-121f188e0a6mr3234816c88.7.1767724848999;
        Tue, 06 Jan 2026 10:40:48 -0800 (PST)
Received: from [10.62.37.112] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f243ed62sm6788547c88.5.2026.01.06.10.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 10:40:48 -0800 (PST)
Message-ID: <6aa8ffc4-2fe5-44ad-8ac8-581e0697360f@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 10:40:46 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8750: Add support for camss
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com
References: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
 <20251126-add-support-for-camss-on-sm8750-v1-7-646fee2eb720@oss.qualcomm.com>
 <20251127-steadfast-red-koel-8c9bc8@kuoka>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <20251127-steadfast-red-koel-8c9bc8@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ba7VE7t2 c=1 sm=1 tr=0 ts=695d5732 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jRZ_Em-5SMcKJbQpHL4A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: 1YEe1aaDslGx_UDH2jN2SprbT57JmTAP
X-Proofpoint-ORIG-GUID: 1YEe1aaDslGx_UDH2jN2SprbT57JmTAP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE2MiBTYWx0ZWRfX7LUNxeOPxdNb
 DJ33TZAs8o+GNaiZUJ+6BevuXTpLUXAvx2IxC4AMJURLOp2+Se5ccIRrhp5ap0eFYNorNw5YWzU
 cUgEKpSUDK4k6KPCt2yLJh2XPI8zBfmTAwUlRZwgnW+K++H8dHmHrnWTFszquADkCDELCgg75wl
 HZ1SL9z+CuF7gB3qULPCOrd4dDSGYaIqA9Yq9AYwyTv9T4pY4NwvU8GuXlNTZr6Iczc9wCrz3Mh
 t7f1r0uJoQsqxgwyzC3ZvgTcGIYCRMsP1HRdjWyu5y45hsYvzsR++1Y6aDa9y3gDuvEz571hdvC
 wKz7+s3v5+YqL8w/gnJFrVubwB8WYxANDZcZEL0Fs9IsVFNmQGku31mNKq9InO9yPfnvs6jJzX/
 iOM68RqS9Q73AobkOQsowC1UaxHBmX0fX0BK/otMcBnoSFCIfpl9mS7okhXkIRGLPceYC95V+ix
 GkX4AjVMUaYVbnBXXbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060162


On 11/27/2025 12:12 AM, Krzysztof Kozlowski wrote:
> On Wed, Nov 26, 2025 at 01:38:40AM -0800, Hangxiang Ma wrote:
>   +
>> +			cci1_1_default: cci1-1-default-state {
>> +				sda-pins {
>> +					pins = "gpio111";
>> +					function = "cci_i2c_sda";
>> +					drive-strength = <2>;
>> +					bias-pull-up;
>> +				};
>> +
>> +				scl-pins {
>> +					pins = "gpio164";
>> +					function = "cci_i2c_scl";
>> +					drive-strength = <2>;
>> +					bias-pull-up;
>> +				};
>> +			};
>> +
>> +			cci1_1_sleep: cci1-1-sleep-state {
>> +				sda-pins {
>> +					pins = "gpio111";
>> +					function = "cci_i2c_sda";
>> +					drive-strength = <2>;
>> +					bias-pull-down;
>> +				};
>> +
>> +				scl-pins {
>> +					pins = "gpio164";
>> +					function = "cci_i2c_scl";
>> +					drive-strength = <2>;
>> +					bias-pull-down;
>> +				};
>> +			};
>> +
>> +			cci2_0_default: cci2-0-default-state {
>> +				sda-pins {
>> +					pins = "gpio112";
>> +					function = "cci_i2c_sda";
>> +					drive-strength = <2>;
>> +					bias-pull-up;
>> +				};
>> +
>> +				scl-pins {
>> +					pins = "gpio153";
>> +					function = "cci_i2c_scl";
>> +					drive-strength = <2>;
>> +					bias-pull-up;
>> +				};
>> +			};
>> +
>> +			cci2_0_sleep: cci2-0-sleep-state {
>> +				sda-pins {
>> +					pins = "gpio112";
>> +					function = "cci_i2c_sda";
>> +					drive-strength = <2>;
>> +					bias-pull-down;
>> +				};
>> +
>> +				scl-pins {
>> +					pins = "gpio153";
>> +					function = "cci_i2c_scl";
>> +					drive-strength = <2>;
>> +					bias-pull-down;
>> +				};
>> +			};
>> +
>> +			cci2_1_default: cci2-1-default-state {
>> +				sda-pins {
>> +					pins = "gpio119";
>> +					function = "cci_i2c_sda";
>> +					drive-strength = <2>;
>> +					bias-pull-up;
>> +				};
>> +
>> +				scl-pins {
>> +					pins = "gpio120";
>> +					function = "cci_i2c_scl";
>> +					drive-strength = <2>;
>> +					bias-pull-up;
>> +				};
>> +			};
>> +
>> +			cci2_1_sleep: cci2-1-sleep-state {
>> +				sda-pins {
>> +					pins = "gpio119";
>> +					function = "cci_i2c_sda";
>> +					drive-strength = <2>;
>> +					bias-pull-down;
>> +				};
>> +
>> +				scl-pins {
>> +					pins = "gpio120";
>> +					function = "cci_i2c_scl";
>> +					drive-strength = <2>;
>> +					bias-pull-down;
>> +				};
>> +			};
>> +		};
>> +
>> +		cci0: cci@ac7b000 {
> Looks completely mis-ordered/sorted. What are the nodes above and below?
Hi Krzysztof, sorry, not sure how you mean exactly. The ones above are 
the pinctrl nodes. Each CCI has two masters using two GPIOs each, one 
for clk and one for data. The ones below are the actual CCI HW nodes 
that make use of the pinctrls. I believe this is inline with previous 
generations. Have I missed something? Thanks.
>
>
>> +			compatible = "qcom,sm8750-cci", "qcom,msm8996-cci";
>> +			reg = <0x0 0x0ac7b000 0x0 0x1000>;
> Best regards,
> Krzysztof
>

