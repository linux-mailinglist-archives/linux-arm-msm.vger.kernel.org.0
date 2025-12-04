Return-Path: <linux-arm-msm+bounces-84331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E35CA2F56
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 10:23:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 586D93007D55
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 09:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5897D2FD684;
	Thu,  4 Dec 2025 09:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rt2nfq/A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gNCYbwdz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF057329398
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 09:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764840184; cv=none; b=oump9qKpO8dVNGfA4Z3NthxelT460XvLQWs4TP07evfcJWcNsxSLkcHkI9mc2SSLGbtMPeQ3dUxpPWADCRQtoJUGV58qP0AXRRNHozyPWnrwatftzuhMtveb61llll8fZYX7+v5udl4RJcI1W7iwXrOtdiA15OCKfLGcHGDs/bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764840184; c=relaxed/simple;
	bh=VZP/EdnogDgQSuo/KxEFLumMit2pZlS0799GKaySjb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kgwx+eu+zzRy62qwMfAeJA49n7VuueZD/zVhjnQ5nRpzPDaC7sYxOeFg8hWIuPqSe9QCzH2qHoNzO1fGgXPeYltQSr+SmvXc7y9TKKwRtQ2G3IRXBoLpv5I8+f4YW7x5YLa2OUP6SO97i2079bDeYgDQ1Nf6BDUdFt0x8Qni01s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rt2nfq/A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gNCYbwdz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B468oYp133244
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 09:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PbJuffjjECzEQUtSUUJ2livpSj+kS9JttgPgzKgWsCI=; b=Rt2nfq/ArclKvYYf
	uOX2Wp42x2cBx9hWm+GdIqZN2koFRNPshuK2g5U8apjnzwBcyE7wqTlVTvtDshXs
	Hu5ZxCKips6iKv68VqMWB6smsGY9NsWYqHqGu36qE8JfBG7cenmPgPO4deH1rIeL
	Qce7O7O5aoQrMXNJ1F/CxGoX8a4hLtiRTxtz2KFN680uG0Zkb2t9QgVqm63f8v8f
	KDeuaH4kfn0wZG2fIQYCrmJSPhgeHSDNo2zgrO0v7IA6XUVmyX3d4QGGsq6H9mgz
	mJqMGlTOBQFVXAoG/0zjh0lPTSCIw7hGAM2C5C823Q231utMnRR4qQv4BcLS0vEa
	up9JLQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atm0hun80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 09:23:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b10c2ea0b5so23379685a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 01:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764840181; x=1765444981; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PbJuffjjECzEQUtSUUJ2livpSj+kS9JttgPgzKgWsCI=;
        b=gNCYbwdz/YVOjfHJ02Lkp4wwHSu+IxjhBLn2e0OOaeiE2YxRtmRg+H8zJDK8yIPnq/
         qtFRSBraexhJsFvnMQH8PVutn8RSjk9Xf75lbW+17FjAlOtCLQ7zfk0CIJcWlWZHf9kk
         bVRjH1pbVSxKcQchqnEuOd3Q49r/jjmBoJx94g080/kQHp8ibofKhxvkBPmvBTColcOB
         9RT9UFjC8feF56qsNVjN2AohdbFuCNF7YT41OaAEQgts0itGp9lWFRY4HYITV9nFnE76
         Mdyo2CHNkJpTJil6ap/sEa3hVngOiR1KB5ae79yhprRZUc0NB/qSqYwEsgnME1EEQ/ZC
         a/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764840181; x=1765444981;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PbJuffjjECzEQUtSUUJ2livpSj+kS9JttgPgzKgWsCI=;
        b=PuizumWHA0rg8JXB70eryQDxlnB4DipBHYVEJQC447wmr8dblDTSmLWH6acsC7KjAr
         r3yVm1vV1i32tNEWH4xJxSSvrNxhU5kpxGqY+4Dqta5Ga/LTaMFtq+aFSRd21ndEgP9X
         /JAV6tOXR1lTjahVQn7PlB59xV1ta9v1/8IunYeGL7kUb2tPel0Qcl/Pnh9VdgtpIGsX
         tFBEHtip/m3ikM3sfr2bnwfWgX5RciBbIdM8butrUBtqnmfaWI8ZYfQiG+8zHkPZ6rab
         VYXbJ1QCfeJIy8C2EWsQjLWB24hnHLAHpKm71F32w1TU7EyRsrRdyNdtmM2MdJiwJ+Bu
         U/kQ==
X-Gm-Message-State: AOJu0YzvSrGhYMSFcHnMtPsA56S762rp7ynQWwhUlugCfv447mojfTds
	f9io5+2afa7U2552zcx0lHGK84H7wVi565cAhqK7IiIanaQdbS3Mqc1ubsqoROl0SyylFfUjynr
	4pxLBNdz/dT5oVNIvFT+04lVgKZGUjJThDXrA5ZpKG9ewSNYgOifxdVc0gqsfITk7eBwX
X-Gm-Gg: ASbGncuMaIXU3tkZg/vmSqtkfPqK7xnzVGo05lmhzg26ZrEgeOMnLxaQpyYga4g2J5r
	erK9KGarVot3/SiW/kclGtXz0t7ZRuAmabPvecwrOhpLCkTJTbP/a9OS8MmFCzZtRgUthhSSLjF
	nRyLMRybqd3ImaQdqRq2r8/BVESghI8z0d8XomiUr/qgljwSYG8lgZYLbDCAlpCZzIsL68058pk
	dVxKIvkS8I2ZvECJW/aEJLlCVioaysfxYl74IKTwxx5H7BW68msGWr7ig0IV1cCxJpkgo4PoWmD
	/uL/pWGFUwndaF0oEA4A9gTZs6Mn+CxFOqR1cLRYRnDGtYLN/uAHDtVEhkwESByED2kFXHGheMP
	QxNC88BjS1CAmshRNs0wt2HdqIA2ujxTiaB6jZKyGJ4fz3XvxVbT+IJw5800WkCW6Ig==
X-Received: by 2002:a05:622a:4f:b0:4ed:6e12:f576 with SMTP id d75a77b69052e-4f017610a9fmr59876371cf.8.1764840180990;
        Thu, 04 Dec 2025 01:23:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIlr+rjoR9RCyBnaNgLjnEL59Zitz7P2P28pzu0H335alGScS11NKS/dVqLgaVEpKVynLy7g==
X-Received: by 2002:a05:622a:4f:b0:4ed:6e12:f576 with SMTP id d75a77b69052e-4f017610a9fmr59876241cf.8.1764840180496;
        Thu, 04 Dec 2025 01:23:00 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f4a2f19dsm79869166b.64.2025.12.04.01.22.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 01:22:59 -0800 (PST)
Message-ID: <7c4c591e-a3fb-4a3f-8a5f-901fec65c548@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 10:22:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/12] arm64: dts: qcom: sdm845-lg-common: Change ipa
 gsi-loader to 'self'
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
References: <20251203-judyln-dts-v5-0-80c1ffca8487@postmarketos.org>
 <20251203-judyln-dts-v5-11-80c1ffca8487@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251203-judyln-dts-v5-11-80c1ffca8487@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IwwIF1z7JsbeFZCTnVmNUOVePz1MFJZ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA3NiBTYWx0ZWRfXyZZX+NZqo9GT
 b0Vp+C/35fxx3tY4uNBI9q8EUEIjsWo6Haze8b1GFlTWb6z5N2BViL8QEKQJ+WPI/OsmUqrc7YE
 zCOZuRJX0BTX9H7+1YCCVX1FCppXMNPXaxFgGP/GrrwGcEBW5bSMpmQXPM5JzkVsKp9z//oovNo
 mfJ0p4bsqKL76oMiyqPSRPoOY0vG0KwdFA6ZIn3aBUASNb4DidCt51BeQe8M/j3DBp74+M4Vph0
 7HTHXvtdCe0BJyrvwflXbMTvgPJ+tyP0kYZcfbKy7t9qx2gl8paBLnII+qPdosbAXMT9ahQacKc
 H66xib4KNr/MhpcVBQAeada43tGJKLc32WTAvJSehIF31RcS2/zx2EqaitaNv3BPhihDs2A8r+w
 /TK/qjazq0MG2WL/51jOOFg3iJUhfQ==
X-Proofpoint-GUID: IwwIF1z7JsbeFZCTnVmNUOVePz1MFJZ8
X-Authority-Analysis: v=2.4 cv=V5lwEOni c=1 sm=1 tr=0 ts=693152f6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8
 a=r0gwGleY-OzFdj7W7YcA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040076

On 12/3/25 10:41 AM, Paul Sajna wrote:
> This lets modem get a bit closer to working
> 
> ipa 1e40000.ipa: channel 4 limited to 256 TREs
> ipa 1e40000.ipa: IPA driver initialized
> ipa 1e40000.ipa: received modem starting event
> ipa 1e40000.ipa: received modem running event
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

"The modem firmware for this device doesn't preload the IPA firmware
and requires the OS handles that instead. Set qcom,gsi-loader = "self"
to reflect that."

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

