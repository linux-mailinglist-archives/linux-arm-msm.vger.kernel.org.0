Return-Path: <linux-arm-msm+bounces-84478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0803CCA7F89
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 15:34:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F0DE34A062F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 13:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9450232ED56;
	Fri,  5 Dec 2025 13:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IlIzhT9N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kdjl92/3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D143191CA
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 13:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764940758; cv=none; b=bUOTY0ZSSlI6TkPysCM1tvLaO/29GThQRVqjjVN6yS3MGll0ORqA8QO9Rdl1K+9qEPnmsQu/VQWBWBxwbqyC/GmXL4Do89Y1ABITLz9kAXTlifmH0MHcFV4iTNLuo2e9Po/gTGXxJib4SFmwAmtK/6pBJfX4PEDshZuu/tE7QcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764940758; c=relaxed/simple;
	bh=N8s2m6g29yiPjUAWZMMcCVwgWqjYLF8q33jxuPLnL9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lQvAT+Tl8HmeuFDJrveM+aXKOwRtcGj7Atd07KSypstjNkOncHLmcpHSLIWwqR77dNSuSTyuX7K+YPYOViZwmkRyHnQOSsu/ALBiwHrPfgSNanXD5vABP/bv50dgRaI4xNffHK3eYvrbmXwN7988pFjYQtCkHqydE681kWMwCvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IlIzhT9N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kdjl92/3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5AoJBm3173559
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 13:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IeOS7lUKPIH2TNJHEFdsgqY3NDWXSlKxCvv9TbzozEE=; b=IlIzhT9Nl2k8IlRX
	qqJavKjRoWJgO+Xon6v2U0SvLI36cfEU3s4DMYFH36EXZlobUUdFwP1yHBBw/w8Z
	Nzi7Ho3LO/TreQeKzMp8dVPcFqv8/0oO7eFryEIkZ+FxuJ/RJRlUSHxVhGSxIyxk
	v4FmzHLiuIyRAEsefEi+mtBmq8cIEW/K+wZJD//UVsEI7Pu+PYM8+S9JWkE489xh
	3/7HdetoPkB84UJKO/lBvLZtOB0ns/9wa1gh8pjX5J20JA8hpgg3EdeNJdoApmls
	j+05LG7yhnIA5T6/timanbgQ5ugahvxzoCI/0fQASDkcPccmQ/jMpf55rS+ST0MP
	jLqTTA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auptqsn8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 13:19:09 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b9208e1976so4051136b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 05:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764940749; x=1765545549; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IeOS7lUKPIH2TNJHEFdsgqY3NDWXSlKxCvv9TbzozEE=;
        b=Kdjl92/3NrNrzC5ZWyOFTNA4nGRFuZ7li+GGFoJuip/lgLnIhcZrABNoDSJ5RCfv0Y
         FzU5E0yYsgt2IhzX9UaYTfh49DdFO8Mj2oITMDlGkqztnj9EkV3Hmomu21JtBz/jb5ID
         HI8lbFOUUinXsoZlTKmCyqYS94qrdPPFtyFqP/BqZjbxOH4TQXSXhIizgHkQiMs+VP/l
         9Vh+/iyoL2hI7ECGt34gcZw6iyjwBVIqcKmgDYqEKVI5mJLhwawM3dgb6co0CHInJIf+
         L2VhjETrqOkZSiGrHKbTEiFsqwra6cgfj9CDH6fNh0bCfzyLwwKeeXBbZwVksqTVfNAQ
         80Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764940749; x=1765545549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IeOS7lUKPIH2TNJHEFdsgqY3NDWXSlKxCvv9TbzozEE=;
        b=V8AubPMZvWkB2uuoKTiUtrPXof+4L2SuscrfjTWfEUBxCkn3XKtoKQJTryV5oxdGu8
         O/5y1PDZSl/peQcRYIRgd+/Ncx/XpfWM28p/zKWDvaMGdijPPN7FXOs0zhhpIFjiAeU6
         6rIg+90aJdcyp1DrSQCp07H8juj6/ztva4VRAcqIsC2e/NAeve0QSV3MxbZpA8//sByg
         GtpcD+RuFOFJby2vpWe3DjS/dxZMoiJf1yzbKIPwh1pCrgXH5ZpnIRP07Jg6YV3Av7/U
         JTIQ5oql72MEzcjgy43OuZnkhG90S/LkFHzHpwgkVVcIfR8er24l0NmYNcQuF2PVLkXb
         OsZg==
X-Gm-Message-State: AOJu0YzX6Tw5omTBT4Atn3XrA5ko70tqd5wIDZ2MCUo07W8LeYVncEPl
	COoaicsj/IzNJ+0zt2rDhm1OrIHCd8JVBlgWzYFTJ0Pbb3kWwKlsEiX5/q83C0sEmugPIDOAkVm
	O5Bxzwn3U4m4PmVLuVrSe7FdmEIPI164zydSenaKl5dQVrzezMNp7Ej2x0A6fKxY3gbzp
X-Gm-Gg: ASbGncu7jLMbyxtpwpBAaeEt3WJ+ntRnG5UIgUnaMnEI4Apb8dJPySssz88Pq2O0oU4
	REibjDC10kMlkxvyzflfI8iNCLcxfccc5r62uEf7r13ulRBld1N55HDFhOd4RN3wcopDDB1VTTp
	rptYF9loK1DJz4wChvhliydIZQNxe5cY8one0tdm1ncTGeij06+9oFw2wvWf1hBmf7rv+DoD49t
	TvkOA13haUaeplmmrpzNHxnlN/kvzmHdQX1rGOjX6YqiiylSuzH3f/+v2Wyzi1cRvLqovsfS5Jh
	C9zFqtnmvbFxoxwltU877fi3+EFo6Ncwy3fj0C5QIZPnDzPVqbsb4+k1MUZWPWa4uULU+v+A7Vt
	UmNBIQUvKqBiMpA1/M4IS+qNV1zQRnVhwBLOJtckivBMbSDl2cmE0pXLzFwRCj2q8/jRqkqqoFj
	Q=
X-Received: by 2002:a05:6a00:1142:b0:7a2:1b8a:ca22 with SMTP id d2e1a72fcca58-7e00f322872mr10314223b3a.25.1764940748664;
        Fri, 05 Dec 2025 05:19:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHD5ZDgh3vT9LKi/qpd1BTKQj2vms89X3YmFq5lxqbqVSPawNfPQnu1UcIRG65q0pTqTzUmfg==
X-Received: by 2002:a05:6a00:1142:b0:7a2:1b8a:ca22 with SMTP id d2e1a72fcca58-7e00f322872mr10314184b3a.25.1764940747926;
        Fri, 05 Dec 2025 05:19:07 -0800 (PST)
Received: from [10.133.33.187] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e801c6a1fcsm456099b3a.4.2025.12.05.05.19.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 05:19:07 -0800 (PST)
Message-ID: <b08bfb85-3aa2-4fa9-afd7-a27c3f5e8a1a@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 21:18:59 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: add coresight nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251205-add-coresight-nodes-for-kaanapali-v1-1-d3d2099b9b24@oss.qualcomm.com>
 <93a4071c-d2dc-451f-bc4d-defeafe383ea@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <93a4071c-d2dc-451f-bc4d-defeafe383ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yBb4Wn2kJo9I7_nFmVIRTL1yU1WQzL5N
X-Proofpoint-ORIG-GUID: yBb4Wn2kJo9I7_nFmVIRTL1yU1WQzL5N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA5NSBTYWx0ZWRfX7sgS/B2AzOHr
 Ukt/0QprOpnPkAVHcoqIwkBhT8UAvuzP++b4oMeNUl3PmwolQTh5t0gZCDjUbcPmyUL5X5cSNOK
 yMc2ar1MnvFCIMi/rQH0yuq5lZafo82G9VptC43QuRjNZ0PWEgbxh7AR8GBid6vJuOfof2KhM3F
 rKA8Xbf0KK+GBbpxxVvvRwTz7PPrbt+kFlrihtnZPydcuNwhJ7qIxfLCJExGIJTS0gjjHhcgeLa
 uncqv+2gI7q0Ls1vCQrp5z3b9+oZ2tcAY2tl+OwJKFXffFR71WpUn2acNPcFEQ97Ahw5Q6jmCPu
 a4hteel9h9StaK1NAFVQ9gtrVX+ikiXLIAZmr+nRtfWLqicN7GE5z8XrovPNj/cyxj6DY+lof2Q
 THiows/oSG8nJ/tc0mn3ToXSJBRpYA==
X-Authority-Analysis: v=2.4 cv=fKQ0HJae c=1 sm=1 tr=0 ts=6932dbcd cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=J_Aou7W4naz4a_YxzB8A:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050095



On 12/5/2025 7:20 PM, Konrad Dybcio wrote:
> On 12/5/25 9:36 AM, Jie Gan wrote:
>> Add CoreSight nodes to enable trace paths such as TPDM->ETF and STM->ETF.
>> These devices are part of the AOSS, CDSP, QDSS, modem and some small
>> subsystems, such as DCC, GCC, ipcc and so on.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>> Dependency:
>> - gcc: https://lore.kernel.org/all/20251126-gcc_kaanapali-v3-v4-0-0fe73d6898e9@oss.qualcomm.com/
>> - ipcc: https://lore.kernel.org/all/20251031-knp-ipcc-v3-0-62ffb4168dff@oss.qualcomm.com/
>> - base dt: https://lore.kernel.org/all/20251204-knp-dts-v2-0-596d8398c6d3@oss.qualcomm.com/
>> ---
> 
> [...]
> 
>> +		tpdm@1000f000 {
> 
> This node is out of sorting order
> 

Hi Konard,

Thanks for checking.

> Everything else checks out against the docs
> 
>> ---
>> base-commit: b2c27842ba853508b0da00187a7508eb3a96c8f7
>> change-id: 20251205-add-coresight-nodes-for-kaanapali-27948a5ddffa
>> prerequisite-change-id: 20251204-knp-dts-4ad60e175645:v2
>> prerequisite-patch-id: 1057cce23a42b5be40a6266d510bc62f756e3578
>> prerequisite-patch-id: 9924e37fffbad0125759ee3aff03137bd1cacfc1
>> prerequisite-patch-id: f7455dd4049ba647ed5f13e14fb99844340ccacc
>> prerequisite-patch-id: efa90c4f38d2e85476f22cc0081d7fbb8a34973a
>> prerequisite-patch-id: 7fc8429ae2438ddf1aa0f0aa005293cc76540f22
>> prerequisite-change-id: 20251121-gcc_kaanapali-v3-ab91e1065bd4:v4
>> prerequisite-patch-id: 9a9cd779ee23419a023893f357decbe09da1e42f
>> prerequisite-patch-id: b7d46739fd97b16bbf635569018bdd809fd30966
>> prerequisite-patch-id: 0baee9ea7681fe6b4ab1c69f1e087427ad0050e9
>> prerequisite-patch-id: a7ee79adf85ce9c5aedca168a561a9560fa59b44
>> prerequisite-change-id: 20251028-knp-ipcc-6b4189f71121:v3
>> prerequisite-patch-id: 6cf08b941741eff023e37a6a8afd5478bdf0788d
>> prerequisite-patch-id: 0ad500fc45e104a874839181b5ae59a4867ba1cb
>> prerequisite-patch-id: 628073856ba29bc3ed64f801dda4c9c7d767f327
> 
> This list however should deter you from sending.. it's impossible for the
> maintainers to resolve a list this long for you and there's a high chance
> there will be changes/rebases required because any subset of these patches
> you depend on may change during their reviews
>

Yes, that's the question. The good news is below two patch series 
already got reviewed.

- gcc: 
https://lore.kernel.org/all/20251126-gcc_kaanapali-v3-v4-0-0fe73d6898e9@oss.qualcomm.com/
- ipcc: 
https://lore.kernel.org/all/20251031-knp-ipcc-v3-0-62ffb4168dff@oss.qualcomm.com/ 

Can I have your review-by tag after fix the order of the mentioned node?
Then I will send a new version with the tag after the dependency is 
being cleaned.

Thanks,
Jie

> Konrad


