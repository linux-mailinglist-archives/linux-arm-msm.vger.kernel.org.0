Return-Path: <linux-arm-msm+bounces-68343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C9EB20734
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 13:15:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56FD27A3E74
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 11:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 206182BE65A;
	Mon, 11 Aug 2025 11:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BwaX5EH/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60592BE64D
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 11:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754910422; cv=none; b=ApfODXILwf8I1GSJeZC+JhhHEM3/wiw6ufRYMbE4dGUfCNmMjiTeb7Kot12lRNrv+XYxDesO8HHICJKKx41ao4JmsM817oZzI8++D4K/jLYTVi6hyMF2OAdfQ+c61IqfCFuio+V3YO1AaDs2yOvOZWUyklAnZX2809+ZMZTI4wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754910422; c=relaxed/simple;
	bh=7qGIv2VMmoh53/xPrZ93lE5MyP7wZkaBAOl0Dkqa0Ao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j6SqsKRk4aX7nMF0wc2h2DAtbEFCCcQ9QrOieI9pKhnMbv/u8fV5zsQZppAhp8Xq9qgqDF7r5kOTIbriJpB6WnY85/OrjKEEWrtYT1VTg0JeRUvIXC3jRVAW7OmDuCPIjB6pwrc81NOHaO1M9sO1mB1lud8zGPe4WTVIq/9yctI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BwaX5EH/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9e9mh010041
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 11:06:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zSz6n6RvfTQOfYt/pcVGk94yjTXS1qFmv6HDJ4iF3Wo=; b=BwaX5EH/9h7AZl+H
	GcfeI6p1RaaUQOd2Vz8pY/6KKqSrkrlUqi7r4va89isjWvnfFzuNvceYy/LaF+He
	loZ3Xjl0zQQaOPr8DVBiYX34AhS1DT8xiV2nOiM+uMIavrJxJG4hlUs9aqOA7Pud
	nj65I8ncZb6EsGWwP1N5Lebq0f9AlYLdrK4hQolAa22sbKpzsDrCb3lEIHKfG08e
	LuBPDDi1VA3zEs5kwm8niClQWvKVEbOAg9oYtQTY5aLdo7AR2LcGkqLhfShjK4x6
	G5W/Oq9Vip6tQMh3oEU2nlIIIAtDcBQdTM7uqW2G4HhXo7l+1DiPudw3+MdBa/KN
	Th2ASw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx2bnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 11:06:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b0adca3d85so6001741cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 04:06:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754910419; x=1755515219;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zSz6n6RvfTQOfYt/pcVGk94yjTXS1qFmv6HDJ4iF3Wo=;
        b=KsNUYDugEtnOQgqtowJRMkMdjknTb4YdXOyc8uikxaKeHKAzlTB5XCexbT6dQ4jKoC
         wzsFh3pWSYlibih9xF9HCSbzudhDDjNF1yMcYDOhIz/d9qSV4sNajfeorCrAFNaLUTj7
         NNYDhGjbssTnVpOWW5mhe4aZcXW7vV40RJ+rpH6ZSdExL9aStPugPH1BLxw7ynBTlHAT
         vFZhDzHsTxH9ENnaur38STAakuTFEfUeen5jJ7D15kHna9Sd4ZvXoyXYQlA0+bC/JX2h
         4+LDaykMu/HWejHYvEgPwV4DwcJRE2xPjl+z68iA5PGGjOefYxGdrs1ULowGkgt6fSfZ
         vMAg==
X-Forwarded-Encrypted: i=1; AJvYcCU0BZ+JidS4u3SQwppfgOSYl/1n085gl5MNYjZJQ9J837m28/cysVCtdPH6s+Mg1OxoPS1CIzVP5Rh2kDvO@vger.kernel.org
X-Gm-Message-State: AOJu0YwetP790aGI9CKAufoGxhP8Fvhuo797Zj6QRxT4H6zpn/GG0HBG
	THx+/FaMLbu/GVviWqTX3FkoZoNR3AXZF9J4h9f3w9lLlAamfbNptxXQWHUJJU77yAH/7isPop5
	gI+kVg5jLkR7EWXkgqUHOm0118YnfqniJLg7rE8szVLylWKNlVNlUmMRGQHZYjSI8/CiZ
X-Gm-Gg: ASbGnct6VPW2ZV8iH2E8jdFyf3yKOVaCXMWYgr5hByMvX31HRbcwHNdZInQ+eeaBVdP
	OXQkUIGCx2oOIN4P8xYWgeBaQ6dx6EzVJUXsGuCDbq8OWwt7out2MqtU6xZpEkH8AhdGNKnxaxe
	K91D0z8P8LKg9ylMOiJ/VwBJ9T5ciKoc10Dm9hAIcCnd95SgAJFyQh71R8tS0enC5CrkEw3TK/k
	jOO8fNsoP67NSaw9D2mFl2oZHWxhcc77yNgb6SAp7C4VAwdzAnVnF+I2MnpUD7LH9e5c3Rwnao/
	s8PVObZPN2vxKd0ECGHwOsKTXKGgIMjC/dMWlB1hDDEpHXc1ECGMLeIy4MV3mTJHYEV4SBUCH/2
	8TjqoVi5MIcNLNFCCbw==
X-Received: by 2002:a05:622a:4387:b0:4ab:5ac3:1347 with SMTP id d75a77b69052e-4b0da992a42mr19224141cf.13.1754910418672;
        Mon, 11 Aug 2025 04:06:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHezk0S2+X+438LvPdPc+q9fDLwWz5D27Izg9g5C7RUB21t8vXyV84fmt0GHdVE3MsjAtpv+w==
X-Received: by 2002:a05:622a:4387:b0:4ab:5ac3:1347 with SMTP id d75a77b69052e-4b0da992a42mr19223821cf.13.1754910418142;
        Mon, 11 Aug 2025 04:06:58 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a24370asm2000917966b.128.2025.08.11.04.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 04:06:57 -0700 (PDT)
Message-ID: <53644b36-2eff-4b1c-9886-591afee8b589@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 13:06:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: sc7280: Add nsessions property
 for adsp
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ling Xu <quic_lxu5@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_kuiw@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250701084905.872519-1-quic_lxu5@quicinc.com>
 <20250701084905.872519-3-quic_lxu5@quicinc.com>
 <nsdj4ytpdn55mn5l2gr23w4whpbt2ogxbaomimqoarvskz3uzs@5mbrq7jvxnp2>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <nsdj4ytpdn55mn5l2gr23w4whpbt2ogxbaomimqoarvskz3uzs@5mbrq7jvxnp2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfXzNkFsPNpyL38
 TguQ6ugNBLN//5iUbFOaIqi5CqxhStBDtfgIr5jiYyiVSt0yV7E2T0PmMUW4hByEBrfWZnULXeK
 SI5z7FME/ju3cPowmGmIOX1C0bgXvLbK3piUupGdWw7Fgypxzg1tc9EEIqoZYPZe0hPHReyIF5K
 gnJddQWyccCk1K9uu15oGTwNKwjOvaztsuM0EcVrUYCACcxv3qc5b0oxgP0jZKHHtsExU//tR5q
 qHJJXRPTwANr1hXriGssF5U0NpkvznX9AJ+cZ/yeiOe6OBxSQukc+TSlHKmUYknrQVW1xx3vQzD
 WznKbiUAJvp87SkNZAYbDU0KNirkTSWBJuoBXozjoFGQo2p530O7luAruIXVpm4GpoF9Qe0yz1c
 Ahms3FJ7
X-Proofpoint-GUID: sJYWWGeTlz7Gvu2__zk5Qs-h47IK3wXF
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=6899ced3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=z0GXuPKBCmORgo7IezoA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: sJYWWGeTlz7Gvu2__zk5Qs-h47IK3wXF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057

On 8/11/25 12:42 PM, Dmitry Baryshkov wrote:
> On Tue, Jul 01, 2025 at 02:19:05PM +0530, Ling Xu wrote:
>> Add nsessions property for adsp context bank to make sessions
>> available for ADSP offload.
> 
> - Describe the problem, describe _how_ the commit solves it.

This is pure software configuration, the only real limitation is that
the total amount of sessions per channel can't exceed 14 (because our
driver says so? I have conflicting information where this number comes
from), but no more than 5 is recommended for optimal performance

I'd rather waste a couple of bytes and pre-alloc the maximum amount on
every channel, so that if someone decides they want to use the DSPs ever
so slightly differently, they don't have to run around changing the DT..

Konrad

