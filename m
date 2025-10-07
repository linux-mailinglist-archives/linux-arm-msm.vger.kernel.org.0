Return-Path: <linux-arm-msm+bounces-76218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C55BC194B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 15:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9687F34F30F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 13:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FD322E11C8;
	Tue,  7 Oct 2025 13:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZJJLtJ4S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858B82E11C7
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 13:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759845234; cv=none; b=OyfOa/9wkaEdTvoVYTGhm0WeayCoFzhpd3n9aoJsZcMx06tKXOAJfmdsKa+b7rCL/7PCtWmD7qX8fy6oNISmEqBqXdlmG+eiufb2OO6ximsORbknOBeGJKczbd6VuziVZ2BFcmtgEUqBD86OazW+4WDSZEAcxj+kOwA3UiOUPf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759845234; c=relaxed/simple;
	bh=cdt+xIUTUY+JbHEpPzEj8o59T1ECMCeqF+g9xZCYiJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pFsbGMsp+RCnRko1KQP//aC9jkLuS5LGKiHM992Zrl7egdpE7gAlhHtrb04sVaXldUASIQNeszARBxwXaglxIV2qZCnkBdlY56nVZzxxZ/VeacBuqq8lOXYKzQOb0pS1Vn+FBHV5wkSB3tP3rc3HPUGQS04hs13dAK59Hd8PaPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZJJLtJ4S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597DkQwP016331
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 13:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fiNc/ZDld9lHBOfROmDO6f0b35mQryE6GaNus4HaVTU=; b=ZJJLtJ4Sa6IzdQP5
	iOCwOhtwN/oa6v65lFuwMLp6viOO2qJQCR1u9n4wsFGej5IO66wSfYpLEIvDU3x9
	sfEFpIzL9WlAgKKFx1p/YNpZjGplIHMmklsCIFa/A/gnxoPMNGdolZoG+bn6sf8W
	ukOH0mGEWNe+WD5K9qtQJU6Vm7XtP54CJjd5lgLGD4k9irY6rYGS89bTNwWrBr9D
	r70G1YpWIXf5Jh1l9DGm8owSPNqz7SM1hDANDMADWp7Bx5az9+uSRZWltKpFL1sl
	QXxNoLSNEVfIqQJ29d1tfkVaPm9Rp0wabvOXfA3uAJsJYOmKnzsSSV17uLmiQFZy
	Z8shlA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtk6yeg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 13:53:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e56b12ea56so12315891cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 06:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759845230; x=1760450030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fiNc/ZDld9lHBOfROmDO6f0b35mQryE6GaNus4HaVTU=;
        b=pi6x53nu5fsn73+ehMsG54qDkijWsbJwZ268KdRNc4doRTxysa5/9bqpi5NUtLa5kD
         CKQpaMKH1AzSO+JU+aapcNLbiPy0DjxZo2MKAKk8/95tY0if+37zoyi3FAETtXpd8/k9
         O7Z/e7s2nqua8ikAUQ96neRKJiMQREvxjs+5wYdW03mxqjfIPULzEHN/OsHb56qimFPT
         jo3h/K3b88K/8pfEjUjXZX44yEn2cjJFEfWdXPAJS1PSd77pSnD7PrLtFKikzDR0ziAS
         N8CDFuoQdOPCBSJACGMhTywRZ7sU9WJFhIiNE1xqo128OrLOpJurxkZCF0yeSaOZbq40
         09Aw==
X-Gm-Message-State: AOJu0Yz/1jlJmbO5odL6g4JkmFDwQh4uMa8YVAlN/CXy7SIuU1nAAQEF
	QqV1RVpKowQkdAywW5FebtaCBcp+aybJUPoWEf0iFlZqtIF45fUfz/VaaqN74aF/UVt2+ia8Ll2
	eX1GYPRpN5gvSxEXPnekjNcrbc9WrhAS8hEyM0IvxoE9j9xbaHVchyZeelTt1hJF0rHpQ
X-Gm-Gg: ASbGncu0/E6KH2bl+C3bRzlXYQ+RLJN00YCaQ8efXTmphkLcClAmXiMPbFKNjbBtGH2
	+WVOKvFp7SamvvQYScXY2GtIAQPJ8PqklM/F/Ar6WeV2/gtZKHivmtSxYp0kcc/AHLmaIoh1hxC
	daOiCcKtOjIlz4kXIuiBlnCiHrklqYo6prDk9RhdN9MsNMtsvsZu4HMa6N1rW9kBb8Ur9PhneUE
	BC82pKaZsdykD+EB0/YpZ20kP0RAVmh6A4NOqzk+8hEA2Maq9sawaj97zWmojJYSpjGHvgb6/7u
	Rf0wDjFiwy0xvdlBoeE1nxizhXqRme3RJek+97mXV1bibtparjmbddIbH9C8Xdv34CmtZK36IiI
	UxU1KhbcgwlBTFAsuK9iqjIKFrqc=
X-Received: by 2002:ac8:7f87:0:b0:4dd:3948:3380 with SMTP id d75a77b69052e-4e576ac46b6mr127531921cf.11.1759845230481;
        Tue, 07 Oct 2025 06:53:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZXrDJuWwO6h54DXmE2fdQYzL8QfITc/WlKY36C1qhe93i2ttKGEhMEDPLcHC8FVYGtfGAqA==
X-Received: by 2002:ac8:7f87:0:b0:4dd:3948:3380 with SMTP id d75a77b69052e-4e576ac46b6mr127531481cf.11.1759845229682;
        Tue, 07 Oct 2025 06:53:49 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652a9f50sm1393040366b.9.2025.10.07.06.53.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 06:53:49 -0700 (PDT)
Message-ID: <fd8bf93e-f6e5-45a3-8e7c-7e63a918809a@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 15:53:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/13] arm64: dts: qcom: sdm845-lg-judyln: Add display
 panel
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
 <20250916-judyln-dts-v2-5-5e16e60263af@postmarketos.org>
 <6145be40-3b2b-4554-9d5e-c1f9fab0363b@oss.qualcomm.com>
 <da2f17a144374f326de9e0c5bec638829a31cd1e@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <da2f17a144374f326de9e0c5bec638829a31cd1e@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNyBTYWx0ZWRfX5AxuQVMGTi8M
 RFWA8IaZD3sTzCq/2Hcyoy7KcBcNoIatjMKmFS4efuitkYLLa+BmwxOwLTtA1Gq1MJdB9MMaK/w
 b1d7pMGBwe5E9H30F5wbYA5xLbTBFeF7SSvzxRf4q/JnRNVQ6BWCX4E+6Drl9qX0X3rcc0vxgoJ
 mTMqlZPekgCWADlvBeE1swhhuYZ9cEHvzbxdpJ3H3KBUu6oQfDs6ZTqaL7+SdELxP61R2NIeLUP
 ox+CMrxQI9NGVsAlyGrGZFdfslMJD2ThZfoJyhi/ckvr4jghTaevdOEZY7KxKy7qp8ZI24WAv94
 0TJBYinGc1/1uR30qCQROQ0mRk3aZcwraUrlZfe5xIcD91lsqoO0/M4V0hFW58GJ+ST7C9+DTfe
 q0vzDXbHjFlRF9VeywFfAJIlIEld9Q==
X-Authority-Analysis: v=2.4 cv=do3Wylg4 c=1 sm=1 tr=0 ts=68e51b6f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8
 a=XKEg-W0rSRFBAHshmuIA:9 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: Ct8GqOiNfXhD2CniVvUHbQnR1Eo7Gk1n
X-Proofpoint-ORIG-GUID: Ct8GqOiNfXhD2CniVvUHbQnR1Eo7Gk1n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040017

On 9/18/25 3:38 AM, Paul Sajna wrote:
> September 17, 2025 at 1:50 PM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com mailto:konrad.dybcio@oss.qualcomm.com?to=%22Konrad%20Dybcio%22%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote
> 
> 
>>
>> The vendor kernel (for Sony phones at least) does pull-down on both
>> active and sleep, making them the same
>>
>> Konrad
>>
>>>
>>> + };
>>>  +
>>>  + sde_te_sleep: sde-te-sleep-state {
>>>  + pins = "gpio10";
>>>  + function = "mdp_vsync";
>>>  + drive-strength = <2>;
>>>  + bias-pull-down;
>>>  + };
>>>  };
>>>  
>>>  &uart6 {
>>>
>>
> 
> https://github.com/LineageOS/android_kernel_lge_sdm845/blob/lineage-22.2/arch/arm64/boot/dts/lge/sdm845-judy/sdm845-judy_common/sdm845-judy_common-pinctrl.dtsi#L109-L148

Take a look at these lines instead

https://github.com/LineageOS/android_kernel_lge_sdm845/blob/lineage-22.2/arch/arm64/boot/dts/lge/sdm845-judy/sdm845-judy_common/sdm845-judy_common-pinctrl.dtsi#L137-L161

Konrad

