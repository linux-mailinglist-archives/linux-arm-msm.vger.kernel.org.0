Return-Path: <linux-arm-msm+bounces-107576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PTmDmqrBWrtZQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 13:00:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9399D540B7B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 13:00:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE5D9307B06B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 10:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B03238C1A;
	Thu, 14 May 2026 10:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WPXgBkWK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C2ooLA6R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958973B19D4
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778756317; cv=none; b=fTnJPrFriSFsGP97nkU4VurHJqexLsgL9Bl+p1RLrUApGhEmxA8vCZTWoyowaZDKR9IF5bKaTiDXpgPmeGnWZp1YucrSG3pGdsi3bb9ptb2ZqQdy5zjZ/hW+jtAf5UA/vEQSFmgVjhYIeNcXDXhIzr9OH/gWt3udVPmEDr5hcW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778756317; c=relaxed/simple;
	bh=6XTTjsFjyY6iJQHy7meB11Yd/k2CmMWBewbbry9SfHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z5af1yVu0AVgUik9vKeeU5DEjEez9c9oY7orsr2a+X3NxS2HqZLIOXqseKIrzhrUSFInGISye/j79vNVeKrxS64bYcwW/2gMvOu3q1PgMT5PiF6F6Wq4WOJlopk0wwW75hyo+7d/JXOpbW1YQ3N4bxD8JB/AGMT+OfVkSdFFwKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WPXgBkWK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C2ooLA6R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9kKAL3641017
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d4tnR3SQ6CQJ0n4VHz7KRV07D8f4nSkV1c5YHTLLUWs=; b=WPXgBkWKfSDYOons
	V8Zyw6lnEntoyM8wItKqcCFNOVKn5LY4QFrIYhl0ZZjFBpthZxifv3XziZDSR6dJ
	nKP/sTwxc8+RSp8oXz759YxnXKiAua0IWlZG/Epxvl1UzHyFG+wz/EC0Osg7VQMN
	fHV14RMDE7KvkjvZlyqC3dnjaB6IrOv62jHUz/SaIFuur/SXwatPODS9RHK5l15z
	PPMFyr6BpmzP1U6ICljUF0JUIU4L2irkLVtN6NY+N8lhSZfwShSgGe2AaZVzbAST
	Ypf7sRnSfAh4KjcwBBVzM7sEx0/Un2brxq81bZwZypCkVG78RBedibz9vbj2x5aZ
	a5Giig==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4v4tup7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:58:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb39de5c54so163695785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 03:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778756313; x=1779361113; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d4tnR3SQ6CQJ0n4VHz7KRV07D8f4nSkV1c5YHTLLUWs=;
        b=C2ooLA6RCYXbqIpJsAkkobMUIRCVvwPVN+n68QPAUjHetZS8QhsUYaMgwXk/S7LgXf
         SPD373LCRfirctLvLD8oKioJm2ogRw9sQ1Sn5vI9/HDIwSg3FhSXl6ciYC9A2qMkfyE+
         LPzXRxry0AFMOeppmB7bHgKlH0fPhz+MwOEaPwwDeylGr4Vg12sQW+NjvpxI9DWxYaWf
         iWPXm/YphzLyYqnEPEvWVtISPk4m0dAMvxu0Dju/mZsNDZuOcTJ3LzjNld2RF4gx0ZCr
         YrsRXYH9XDjrSFhi2lXb1ho9xbeZZasjqFYCIl3iCwXsOhIcBbVIE6/WtJNFGYfjhEuq
         ejjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778756313; x=1779361113;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4tnR3SQ6CQJ0n4VHz7KRV07D8f4nSkV1c5YHTLLUWs=;
        b=WZ0UGOujc7gpR5Vbr7Mt68byzj8adaUQ1sM3ZpB/QQAwDheRF/JjxxCBkL2Uvdr+Xz
         qPNRvYLcrywOsfESF6EjtKLIReYikP4F/lyQ+Gs8jstSAi822+VhitGfh/xNq8NVWhRo
         WRX8s1XBo7psW4P/a61gEKAjP9gQ0kkoGpJhCvWZzFdiqmUSJd4sPNdboxyKrCbwfzKi
         XqXn5vZSmi6X4Ecux3apFPhX2vhqWfzpSWMK+S5D1XtyK3fyl0I+VjswVM1hO65BOS3y
         F2zN3wI6nM2he3ZhdeTxYhWk/bqDzW1gzgzQGclRBQY82FdQYqPZ3DeoDJRHX0BjhyVf
         JukA==
X-Forwarded-Encrypted: i=1; AFNElJ8GBPpPY1q5je7NkPK2aYcIHPx5vDowsoLGsTohK6y4uhjE/gW1OAnBjbqlkJcDlFRi86IfBr8+6D1z9uDz@vger.kernel.org
X-Gm-Message-State: AOJu0YxclHjLcT3Uac5C95rvzT+9xqXLxtIb+ITRj7jvc3RaeV2/dF5/
	hd1WFGKbpOHtXHUeL8ESbuIkzuHQOPKL2mFbOl5NGCP33WzQgwzY4673+t4+UylMFyzhfZ65lFP
	MjTSi6Ijy3giR3UyGAIoY2IV2aI3crns+woRWSrHEqJt0v6ivJq5nTaGOWCeQbVzp2P+Y
X-Gm-Gg: Acq92OGbCsku1HX7JeI+tGYN+3D9pcdOleTqci2oDgehHIoB3jPHRnP3EjweDVWArU+
	x2Yso4tlEGjrhfNxhu/MG+oiNQR1LuBCj0q5jLsqEXXCiDtsVRHMEruhIt78aD60GRrTCFr2Ffm
	LDUIdVCLgo/IxWII44agytsahA8T5z/KPZH4May1S8edDbPUmMqprXDFB26XiA1KbPawx2R0T+R
	1ch8RpaBEZ00kEfCKnyb+DScSRt9KsTqdGP04yWDntsgmJi0zoCETTpoSTejzGmthw0djunW0tC
	ywYnA1bA5bdyZua4vHcBgkG9he4tR7CKLB28Ht/1SVQvdubKbCIgBXxb+FPGIWqtpuYAJfOskXm
	AJdcbgmW0GjbwY8W6mvrws8DaOleqkhBrJceqKi//zyXEEzG5/ZNG2U+kV4IouML4ZZZ3S8caWs
	MuQVi9NzAFkkvZUA==
X-Received: by 2002:a05:622a:608c:b0:510:144a:636 with SMTP id d75a77b69052e-5162f682709mr64383671cf.8.1778756312885;
        Thu, 14 May 2026 03:58:32 -0700 (PDT)
X-Received: by 2002:a05:622a:608c:b0:510:144a:636 with SMTP id d75a77b69052e-5162f682709mr64383351cf.8.1778756312468;
        Thu, 14 May 2026 03:58:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b3e8e5sm612419a12.4.2026.05.14.03.58.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 03:58:30 -0700 (PDT)
Message-ID: <f0738454-abd9-4a58-ab2a-df3479b78e95@oss.qualcomm.com>
Date: Thu, 14 May 2026 12:58:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] ARM: dts: qcom: msm8974-oneplus-bacon: Fix sn3193
 shutdown GPIO polarity
To: Jun Yan <jerrysteve1101@gmail.com>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vincent Knecht <vincent.knecht@mailoo.org>, Grant Feng <von81@163.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>,
        Wei Xu <xuwei5@hisilicon.com>, Robert Marko <robert.marko@sartura.hr>
Cc: Pavel Machek <pavel@ucw.cz>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Jisheng Zhang <jszhang@kernel.org>,
        Enric Balletbo i Serra <eballetbo@gmail.com>,
        Romain Perier <romain.perier@gmail.com>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260508152435.21389-1-jerrysteve1101@gmail.com>
 <20260508152435.21389-5-jerrysteve1101@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508152435.21389-5-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XIIAjwhE c=1 sm=1 tr=0 ts=6a05aad9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Ffu13P_rAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ZVWV2uAXYixwFVVeF7MA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=PkESTBlHdS-WH8rZy7fl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEwOSBTYWx0ZWRfXzMW1bhOASY2v
 dDwgJVbZ++Rfc0LdtRuYCQp2a7XmgFNksUAgvWf5pNkiLd/+LYAl/D5mez7TCC7ZTIMe9yMAfTS
 czuxNWfldemFP5h2PofR8E2Y3GiovXrOfhEgeMxQBw2FPJQ+IHO/3zHrVhlb1zS6qqx7AdcUvhW
 uADVkdoXw8J9Mc1fJBz6YBwStMPU6980tyDOlNz/yrah2VVnQAf7L8UNKBGXC0JqRTxfumcHDkk
 qPOE4cUNBF8nxK38olknikmNSHZ3T4lPrMNohtkD7Wy6Q+EcEYVctDDNQUg8iju8R9dSBrgcq7g
 lALmc6d+96Kx1MHuWIFpwl4sES9tfcE5iCnQM2NLs0zAajzCUsSq+hPgZiKd8oEzh1UayShm/sr
 lXif23cWHIzdTFf8XjspqAw5/hNy1LDusmkj6A9Hf45NxNUsUCdTs2ty9hbeM1iC+BoC4pNZq7d
 tyupczOALTJI7pzqAjQ==
X-Proofpoint-ORIG-GUID: EIp1Hd8wA6q4fFC7ovRymdO56u253KUQ
X-Proofpoint-GUID: EIp1Hd8wA6q4fFC7ovRymdO56u253KUQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140109
X-Rspamd-Queue-Id: 9399D540B7B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107576-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,lunn.ch,bootlin.com,mailoo.org,163.com,arm.com,sntech.de,amd.com,hisilicon.com,sartura.hr];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ucw.cz,kernel.org,st.com,gmail.com,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,lumissil.com:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/8/26 5:24 PM, Jun Yan wrote:
> The sn3193 shutdown pin is active-low[1]. Correct the GPIO flags
> from GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW to match the hardware.
> 
> [1] https://lumissil.com/assets/pdf/core/IS31FL3193_DS.pdf
> 
> Fixes: 724ba6751532 ("ARM: dts: Move .dts files to vendor sub-directories")
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

