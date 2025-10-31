Return-Path: <linux-arm-msm+bounces-79939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5863DC25C49
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 16:10:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1AF31A64DE4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 15:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AAEC2BE63A;
	Fri, 31 Oct 2025 14:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GaUlG7Kr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e4Y1UnDS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702F929A312
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 14:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761922285; cv=none; b=aKN4GqEOAr0PeFSvPPGkKGR6aHxsNusPzoK9EoRzortQR7gq6SDWIgCShdtFgyDFUo+knMOcRP1US1SBcXJYksw0alZ35mfBEk8tUbT+lRNe2PQWkiVQgiYaIbDp6LPzJGK9G6jfUrdsIGen+wxMZRMwdBNPha268bh1swuFs7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761922285; c=relaxed/simple;
	bh=6PvX3Mn7d/srGE8PUw02gWJHJ5kq5GVJeIMKoqGjFQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=glz9u90DpUGaI43klmp65qsdF6ohrCk+SK7aHyEg7cDq+mqQzRgeDCe3k/gaXTq6DTimehLkQi9hLyifu8Ie4tTPwMaRRb2HGS9RvgFNXUErRpSiv+ysrdVzfsLUS58eLUgdSO4FDK9rYajGqMYG5OLZqlXseErP4ZfIReqLh9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GaUlG7Kr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e4Y1UnDS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V73WdV2058996
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 14:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	25lyvdDjDQqOSKonxMTWI6lwYX4gVE6aW7eDSRoi110=; b=GaUlG7KrueyJWuCq
	5f9zW6Gud+VKZ+IJkUKnRo937G6LI+X81gYf2Cyb/V0bD447Kg8w4Do3eGMzdoGe
	iJmpTzlVcq+RrYRZxhXgJS0tWqGMXkZCEA65CNh1GDGZp7w2tTegDlvatCmhPfma
	HHf9vNJHG4W4+uFA3kirL6HMjm5zIa5R1YcUGd/+OTlVpLyiASjsSPE2lo87z/ZG
	xW9KLezygMeucGYWzkq96AhUOUP7DzD7zRwaEj4vhiovA+cDkB+4dST4A41IVbOy
	FpfDS9WcuGBq9/SKi/axPP954A925UzlGhiepuzXPkiIeUNyTBfBeD91b+iXtR5r
	cstiuQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4rcvh812-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 14:51:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8a1ba620dc9so905749585a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 07:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761922282; x=1762527082; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=25lyvdDjDQqOSKonxMTWI6lwYX4gVE6aW7eDSRoi110=;
        b=e4Y1UnDSAeeTDNQ9W4sq2A2TsM4lAqj3KT7Zvp9btPToM821C2iqbhV4Qwi+V6kgJb
         gHuB3+g1ZRgem1JQigdMoNv2YGxsNk+2/SGpMlI1TvVnJzHWVnXyIwtszhXqK1ReUfAn
         ZoQcu+PeRB1ILdaDBkmTdgnHcCViDll6Qp5Zz9ORnS0pb95S1WAwmm9hHqgKlBhlhnkh
         zzLk3AUWtA1Uc25M8doahEzpnOVvOwjiCWnZV+ZEMO9e4aNGsECPqRgnp3JvfRCbeBsM
         1+MIHFMF4hmeIPHrqCfDVpxN+txG28YmpXTmFxtTVFO0SpHMW891xVdptu1/pGXTikvI
         zGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761922282; x=1762527082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=25lyvdDjDQqOSKonxMTWI6lwYX4gVE6aW7eDSRoi110=;
        b=tCAYzslsLMSeNObaCu2xYIBmKTWrdBqgtXs0CiFzZeX5WW+VN7D3oeRkT3qGYR1yBj
         68PtgviqsY6yOCvCcO75Z7QyJRZV33BFnFIQG9P0jcjo0X/H90aDKz3heuSOcxqXX7cp
         H3t2QstEejSoueNN+9JlhZYPz2ic18OxvLjV5lMRzfG5bPSX+DZZocZbKIKrZe4taA+N
         kTLWSeksHiAYyvcBJkiXypbuhB9J1bNlN7iDSeb0DGLuQVLu4zdhp4whSPs6NUtJuHqY
         +7ku1Ooxq51tDYObA9nL1dL/0z09ZjVk9gETurs4Vtchz/IU4qLC3pjqkZC0BeYGUFPv
         LGcQ==
X-Forwarded-Encrypted: i=1; AJvYcCV66KWoZ1vN5UkU29GdFCeKOYCfG31qzWhfo7sVvdLl3mBysWV3epxD55+wZcaG1uHxUZZC066cyaMpucjX@vger.kernel.org
X-Gm-Message-State: AOJu0YxH57Uvr2rKZyE23OhCn8X8USgcrdrd0BzWSAfs+0BUSXhAFyH0
	J8K1c2TvFMnLIx0zHwcG4ZZ4QI2PvkVHdejkjm2g6izm67nQPSf1jmw2gXeEA1AHAGasEM/g2Wg
	SG4NmRd3ZXZHXx6UrKwWubw7mTzcYhwMB7AId9JhGU7sP9cojCpcJS6kGgyjGew+Ty2ex
X-Gm-Gg: ASbGncsyLu3X72z6gr9W8RMnNzAq5pEzh2ArO6YbhXhk+FfikstL7wlC7QTBjh5g30c
	plM8HgF3HBxD60PN0pciKRp2F0uCsw4ice21XKu44JdW200HzRCwbpLiA09XYRS2lf8RTk78vgN
	0krA8lAtlive8rf26JF6mNg5OWU7iQEZwAYhAu0AOQgudykamS7VFZVnK4tWxUyTc6YSbwpRlv5
	qEELA/LWU7oq3d8mOb9wKXRoBn6sS//bbgT2UYV3QioNcHhUg395RrgYvnTOEYpXDw5p8t7SvF5
	dAqIVX/8q5guSHO3krovFMSTxOP9EX4iZRZZzNfWOw6m+cL/XJPbQnVDeNe36tiUL58Hp8mPi3m
	ZcRdcGVlNamoUfO6QZgDn7Ebvag==
X-Received: by 2002:ac8:5d04:0:b0:4b5:dc4f:7d67 with SMTP id d75a77b69052e-4ed218b2d97mr84166651cf.27.1761922282462;
        Fri, 31 Oct 2025 07:51:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiqlPMTbBzwyiCGaE1HoFoxKY7o0FlGWqZYGr+NFtP767aljy4Y4P8W3NpsXWiQgKZbZKCfw==
X-Received: by 2002:ac8:5d04:0:b0:4b5:dc4f:7d67 with SMTP id d75a77b69052e-4ed218b2d97mr84166221cf.27.1761922281971;
        Fri, 31 Oct 2025 07:51:21 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4773c53ec43sm599235e9.9.2025.10.31.07.51.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 07:51:21 -0700 (PDT)
Message-ID: <34f9dac5-b872-4384-882d-227f0ee06453@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 14:51:19 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] ASoC: codecs: lpass-macro: complete sm6115 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robh@kernel.org, broonie@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org, perex@perex.cz,
        tiwai@suse.com, srini@kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alexey.klimov@linaro.org, konradybcio@kernel.org
References: <20251031120703.590201-1-srinivas.kandagatla@oss.qualcomm.com>
 <dsgivtqhje3wnx2iuma3ngnq5kanmt6eautay57raf23vcxi2i@y5b3sg3mn5mh>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <dsgivtqhje3wnx2iuma3ngnq5kanmt6eautay57raf23vcxi2i@y5b3sg3mn5mh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bJYb4f+Z c=1 sm=1 tr=0 ts=6904cceb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8Xdm6kdhLhAbRQ0PksUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEzMyBTYWx0ZWRfX1/T0Cbhj2fhp
 xvZiO4hAzWh2FTtWY1k8oGiOtcUif+b990CmEgMHSnop6ldXQeVK0ouTT1fZWIFSRoQLKleaIqA
 sblptNIgBCv+ZjB6hEJ4nABB5pRowC2ow7Bm9Ydk6pl6tLo4hS/embcfQ/aRp83fb3CZjB5G+x1
 tMOyjepIqnSgsupdTfldIRhmRNXe2O1qbpdcgcKsi217LklpccGOlQ2zblP7Izj7F87gOBmfI0H
 4nkqWHgV+7nSdh79nef0/8FEXtLgd+iKrkUm2Res3mRMNdXMLfqk+PDoYieOOPE9iRR3QbORo4K
 GQGwO3pO+Wrk/jpDqcvO5W91hgf66DPBleq9SVtpTga7isIoBbm6keHV/HIPYDH8UQ3ihMDLxku
 9EUY745lwPyFaJAA/VEjdImQpptDXQ==
X-Proofpoint-ORIG-GUID: Rpl_aKznkdR-nDeFDVbAtcm2psimsN5h
X-Proofpoint-GUID: Rpl_aKznkdR-nDeFDVbAtcm2psimsN5h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_04,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310133

On 10/31/25 2:46 PM, Dmitry Baryshkov wrote:
> On Fri, Oct 31, 2025 at 12:06:57PM +0000, Srinivas Kandagatla wrote:
>> This patch series fixes SM6115 lpass codec macro support and adding
> 
> Nit: adds
> 
>> missing dt-bindings to complete support for SM6115.
>>
>> SM6115 lpass codec macro support is added partially and broken to some
>> extent, Fix this broken support and add complete lpass macro support for
>> this SoC.
> 
> What exactly is broken?

lpass tx macro has soundwire controller, reset for this is not handled
in the codec driver, First patch in this series fixes that which is
also explained in the respective patch log.

--srini


> 
>>
>>
>> Changes since v2:
>> 	- fixed a wrong patch that was sent in v1.
>>
>> Changes since v1:
>> 	- cleaned up va-macro bindings for clock-names.
>> 	- cleaned up va-macro codec driver to include soundwire reset
>> 	  for sm6115
>> 	- updated tx and rx codec driver and bindings to have a dedicated 
>> 	compatible due to changes in number of clocks.
>>
>> Srinivas Kandagatla (6):
>>   ASoC: codecs: lpass-tx-macro: fix SM6115 support
>>   ASoC: dt-bindings: qcom,lpass-rx-macro: Add sm6115 LPASS RX
>>   ASoC: dt-bindings: qcom,lpass-va-macro: re-arrange clock-names
>>   ASoC: dt-bindings: qcom,lpass-va-macro: Add sm6115 LPASS VA
>>   ASoC: codecs: lpass-va-macro: add SM6115 compatible
>>   ASoC: codecs: lpass-rx-macro: add SM6115 compatible
>>
>>  .../bindings/sound/qcom,lpass-rx-macro.yaml   | 18 +++++++
>>  .../bindings/sound/qcom,lpass-va-macro.yaml   | 49 +++++++++++++------
>>  sound/soc/codecs/lpass-rx-macro.c             |  3 ++
>>  sound/soc/codecs/lpass-tx-macro.c             |  3 +-
>>  sound/soc/codecs/lpass-va-macro.c             |  1 +
>>  5 files changed, 59 insertions(+), 15 deletions(-)
>>
>> -- 
>> 2.51.0
>>
> 


