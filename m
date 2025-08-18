Return-Path: <linux-arm-msm+bounces-69513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 751DDB29D59
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 11:13:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90D991886CE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 09:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93C1A2367DA;
	Mon, 18 Aug 2025 09:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q+rKIoVd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C3830C37F
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 09:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755508369; cv=none; b=C5O//6sP6HiOiHCxt8smRnbwbMZFJGtev8cKBNfnadawctjVfNkrnsdmosE1IN3Ei5f9NcUYjHep4QreoxKzoMIRzNahXDYa6LxtC3duiqhF2NT8wu6+WBKpbG6u+yHfvow7r68gjLZKdU1KEbboeWFB5dnxOMYizyy+6TOTlbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755508369; c=relaxed/simple;
	bh=hoKhlgCsaez47ChkXd4smB04QyZuLTl2dlMho/S4q3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XDkgOfqnVISILkXHVYJ1klqhtcVDOnwjf7z7nfOckfcEqInJ+nyw3EjmMUaTYUUqisVs217R+oek6kNDxRQI1t1JYmJYILs5p+cir2yaP12o4MBHXFjNGzM6DijDYnv/D6tIDmxRWmiIrAgAt+SwMN95zuQRJ13aqXThQKj6q88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q+rKIoVd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8Oh8V017560
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 09:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	miHpGFSXBHte0kT1H33Cn6X49n9fxBNnCXyhZUBomfg=; b=Q+rKIoVdHK+xGXOh
	j9QMZbRQI9sy3NazN30IbbQoelMBHTflj4aFO0bnzu3L9Lm3ZnmNTMXz9xMuy7Pl
	uAVaXwM5rgT4A3f7x60WkOINsZ1romHkqwAPkPaMeteGwCywoKDWd/Q82X3veSOg
	lPrOGEg6sBF6oEPLujhwPau1oFHUjAWtSOsq5D7Nq9Xpk5DFQS4hwWDpbwSi1RAV
	DnpnJ7/W4+Q8JbwEB10ECvAGt2mYlY9sFzbwzXSWWFEaEiTC26Y35LNZYSFMDKAl
	lFzfvPWom2RQwly5WDkIZPA2QBdyQjFB2ZT4v3Ve4Tfvn4ujo44z9Ck+3yjtD13h
	PqoR/w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh0742mb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 09:12:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24458297be0so94774605ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 02:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755508366; x=1756113166;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=miHpGFSXBHte0kT1H33Cn6X49n9fxBNnCXyhZUBomfg=;
        b=OypncRfiRw0pkfficinSgpfqaDYDgLJWMWUvrr/bP8+dEHSoV7RVk/c9OIWzUlYXse
         On14WAwhgkzJua7BF6YM5hXDIL6jDwew8p7GDONTe+lRh1h0RYjCeKx1+9GSMUo+a1pM
         pkiRIh3S0pJTcrYXfrcAjaFr25eTdI8vaP/eH5KS7+8+ninCRVTJkWIzrAc93ut6T2DU
         9E4gzL0OczxLVxkGprtKOEYW2MBjWO8fiuLqe2uTXXRvSaOI6A+KusHIKGhNVD9CymXI
         DUcJrL3CVL8oXIEGwsmT/25uX6o8Jm7J6ALtP0pZNVVJtRbayPbXWPgCIKOtPb/nq6wk
         ivxw==
X-Gm-Message-State: AOJu0Yw/9VQy1PnEzuynNY7F7F8QQhVZYB9vOXJZx1ENXQTGmjicI401
	f+NlQu97NcTu7hGmSUADFF5uWrtcTfrwiINtnGC7G1DS/oKKklBIihlLYpy1PxfcXoHRqln1xbK
	JC0lbhxi/8Udqd5plF96gs9E7sF1aGlBcGJijRnQwBkjqZ0in06KnPS0NAMWlmZfGTey+
X-Gm-Gg: ASbGncutDIw6DrORdGQ0NGEN0jZ921InRsns7eyT3FhKYSk3H9atVO/OHYpx72on7MB
	dHDXJaQfg/QlliVs7XZ70PSK5YBPn5A6OkakzpZD7UPrI7vj3Xs7CxWCIoAdCjL5JJUT7SioF9X
	CnaOoxlXauxteH3LZ6kP3Gp5liaEB08CI9iH8wcmoMZqa9BHcGXOcihMTmCfk7kPdOdGOoKStmK
	POfjnoDVVUKXa9ERIbjFNOYbi7bTbBZc4ofvONlC10qMQ457x7vr9omxBheP1rCXJoL1L37XttX
	SHRXTgxAWDa5sGNUUJlpXlI9O28LcEPSXhgLsaEsQyahSq2CqUvzLyCfvr/bt2xGFei4567+7+Q
	eyoZ/
X-Received: by 2002:a17:902:f68b:b0:242:d721:b019 with SMTP id d9443c01a7336-2446d94ecd6mr204860175ad.38.1755508365635;
        Mon, 18 Aug 2025 02:12:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGI+ZnayBkfh1I+LDsy5uA5eP/A0aBudlcf26OZjn8mHjvl9WanZtIa98AhhG0B3aE2tNRFYw==
X-Received: by 2002:a17:902:f68b:b0:242:d721:b019 with SMTP id d9443c01a7336-2446d94ecd6mr204859675ad.38.1755508365189;
        Mon, 18 Aug 2025 02:12:45 -0700 (PDT)
Received: from [10.218.15.248] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d510f07sm74995495ad.96.2025.08.18.02.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 02:12:44 -0700 (PDT)
Message-ID: <14d0e02e-350c-42bc-93b5-c81e11b3bd5d@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 14:42:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] dt-bindings: interconnect: Add OSM L3 compatible
 for QCS615 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sibi Sankar
 <quic_sibis@quicinc.com>,
        Odelu Kukatla <quic_okukatla@quicinc.com>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250804061536.110-1-raviteja.laggyshetty@oss.qualcomm.com>
 <20250804061536.110-2-raviteja.laggyshetty@oss.qualcomm.com>
 <3b79dc0c-0bcd-47d0-ab10-ba1514466d65@kernel.org>
Content-Language: en-US
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
In-Reply-To: <3b79dc0c-0bcd-47d0-ab10-ba1514466d65@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uI0APHSRmHHYrrquVg9citdLWYrZCwS1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX72NsMjpg4NKt
 4RCm4w1UScEQxLP+XTDQuEbrBz1TkGrzL8fEN5qOLNAthzGot9sjX9Q/0Ne39wc9HWr3RY+OOGw
 pc5QRkXaomoDnZu1/z9YCY2H9XmAn5FRvOs5E/lkXTJc5Unf1kmVcvVm8Uq6iZXFV/FzAs++452
 HfNKSK+wA6PE8t7FPRTmWic2zQ2Vb2raJZpOGStS3zIqb2E9sCD1pjwdRY8raOvwufxbJwwBFT5
 ZaQUTItyyAzHxlqPnRG5L5wlAXxkEWyGyJ5BqOI5AILqSM+IQ+DMHekMVc4EkbajpnB6CgAZ/Fg
 yh5ryA+Wqp6Brjix6kKXN/wPl1Fr7D2TlByykH0LqRuVFI+8SffoM4u+6Gxzzk0khPKx8bh++ue
 5HvuZxhB
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a2ee8f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=smnEWK7FS6KibTvaVXoA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: uI0APHSRmHHYrrquVg9citdLWYrZCwS1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020



On 8/4/2025 11:56 AM, Krzysztof Kozlowski wrote:
> On 04/08/2025 08:15, Raviteja Laggyshetty wrote:
>> Add Operation State Manager (OSM) L3 interconnect provider binding for
>> QCS615 SoC. As the OSM hardware in QCS615 and SM8150 are same,
>> added a family-level compatible for SM8150 SoC. This shared fallback
>> compatible allows grouping of SoCs with similar hardware, reducing
>> the need to explicitly list each variant in the driver match table.
> 
> Drop last sentence, it is completely redundant. Do not explain to us how
> DT works. We all know that.
> 
Sure, Will drop the fallback explanation in next revision.>>
>> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/interconnect/qcom,osm-l3.yaml        | 5 +++++
>>  1 file changed, 5 insertions(+)
> No, slow down, this conflicts with other patch and makes your entry
> duplicated. Just squash both commits.
> 
The conflicting patch 
https://lore.kernel.org/all/20250711102540.143-2-raviteja.laggyshetty@oss.qualcomm.com/
got picked into v6.17-rc1.

Thanks,
Raviteja

> Best regards,
> Krzysztof


