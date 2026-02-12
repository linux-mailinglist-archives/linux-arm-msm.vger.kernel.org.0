Return-Path: <linux-arm-msm+bounces-92693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Cj+GVLEjWnT6gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 13:15:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF1712D565
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 13:15:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E788305D6C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 12:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A2D2C08A1;
	Thu, 12 Feb 2026 12:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kBJeRUxD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XQQ7ObxE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1C7356A2A
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 12:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770898511; cv=none; b=H9/9bvogDtY4sJ8KgU7V2Xs1H4IXiHsaGJICh/WEtcnGE/Z5SyBcUCF2QkMzOtS+ioJVOEKUWCVihO9vegDuWnqBa4YgnwjJBRzd+SriCi5oP1cNFT7piQIraY8oZam7ZD5p0F3O7F9XWZC6dwC5uaQ2ZflZ9Hg4MlllORSpYtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770898511; c=relaxed/simple;
	bh=Oby4EjJcHADz63zj/1EGulJp1MJlXVouqqj8/ZX/hF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i4tBypPTlpg+XhmJyYGcNVkE6YmkQANbtGfxrQ9tB+tlHQlIckKENgAO151RFWgManAJ6jmH7KP23Gb59JuvtLg61V6a/71TeUcBB5R1Iks9q6YmqpHneg+ztSuxr2t7xjYarw6NRNzvrdBB//zhIK4C35Ghq3YZmBjL+n1hnMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kBJeRUxD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XQQ7ObxE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C9o5j93562064
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 12:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pfMwg8PmT1mIWqEb1KGB08f7tOELO1EnRMqkw0s9nXA=; b=kBJeRUxDd7YU1RO/
	CrVfKp82fJpDdh1WwhFuk/tqtxQwJ0FtlCYaaBFuLvmXbP+Vc/jlJROLmr3FourQ
	mpUwGpzHBSTbWIeVHx0DaZTZP0KBIhpS3515GMAXLqdFoYRrDqRazfUHaffGNZ9a
	3dEzMsjn9R6CqtbO8ETz2iDO9f/pdqU+IBXrb1Mh+AtzftD9rhVlXEm4cNr5RWFQ
	P0J6mymyxPz1jGy8RyTiDqzItV7ww8STqfFSn5iz04sP7p3e74+yZjv85dvvxj3n
	Ico5oes99ez094LOjpTHy3AJMmZMaDIfpZRzZbSdkH8qQDukkHSpaZVnAgx0qbei
	HePf0g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9ck2gejr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 12:15:09 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8946c23cf90so28533136d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 04:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770898508; x=1771503308; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pfMwg8PmT1mIWqEb1KGB08f7tOELO1EnRMqkw0s9nXA=;
        b=XQQ7ObxEP7RD20y+rlt9g12iLOvitWvwk5GpuhYWHA3VZHnMqcdNx/7sFzJMJF7kaD
         /JFTLTjiFG5TC4B7qPyqr/KpsViA/9D+6a0tLFhEaSzYbf/oxMe6TbjqD5YazP2TQb9s
         EjVs2sQezTeB4097bN0AXpSmA0Bg9vT4hKyzsI4i7UV86KgtPYsEGT1fOEiq7ooiwgD4
         Jf0igaVC6n3gNIfLDpAAUg+0qXZ/oxgFkXsgBUYHVdjtpIZjzC42qs0cA1FO036e+x6e
         6tV/ovg0W3Ge70NwBF3eaE+26+sDhWQ5hJUjsb3WG3vxfk7I1tAZbVN2LvGY1OTI/rX9
         VTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770898508; x=1771503308;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pfMwg8PmT1mIWqEb1KGB08f7tOELO1EnRMqkw0s9nXA=;
        b=LwmO0MuVeVud+oxKc/7KRTCYB8tSl1rKxP2mbDT3F1DJfweEf8+4ne/xo9/7wuZGL7
         muSmdXADjaYiNDBfiR54RjWibzhsD3qA2UpA6h++CbpaiwT3ZYKWJxmati2TutXbkwuI
         W8fh7/mTG62ivtabMeu/chS3XGpItWwTv8YfrC7tunMeqQPkpa2M3EasgVWw52HJWwmu
         3+P1LjCLvzuRgm0JFpVNp893FEn3g0Tc7502lN3wXEugf9o6Ty8wsQGZiH1FnBXav5cR
         S+mXZNdyNEVoJb89M3oZdHHFliAxJQCnE34vJeEBxcF2AyGSDUqMu0oJbReyXlIVL7kV
         uv0g==
X-Forwarded-Encrypted: i=1; AJvYcCUE+QGzoDyZjfKzPP7AqIQvF9N6Sbf7GJ1+tFFJTo8X0OZY9j/TlCsL44mCbx9O4D4WlxRjy2Z68BS9KTmN@vger.kernel.org
X-Gm-Message-State: AOJu0YxLocbxZUlTWvzv1coZO07bP+iJCwqf3YlOoq6D5tO0BfNmaSyF
	+KDPiVPkzB2cbvDITM/jHqyahVCA4YzkRcNnBuijnFSvaDcGHR5OO1+yfLk69LssCyJ9OJMS7f5
	RbUPSbC6o8oRTCdzONfyfpvlEtnCTTm3ov00UPLcwMRUDf2vhPPP4B3raaRFoiw1YPsLH
X-Gm-Gg: AZuq6aKlSdCe/qymZGN5ZqNcSbywvu6L3EPdgDihW8tGEyO/sXfEuBtlbMo3KpxRSSO
	LsQiWK/I3ck8rzcqxq2RDnZwD8F2cZuEALSEwSwghgpH3r2JRqPa8UJiQpUM2sZFv1Jurt3GFyK
	Ko/uRYQE446qg0lqjpAjkM/zi/Ah8Pn3bip+ReB6PCiu/HcchEHZIotS/rziunQeyVGoEuoCEcA
	af8QoZjaRsmqMwlExwnYR06GxWHazc6wVT99PbNzffibCNMYqhalnWTx9SyH1qrFyrY71yluZtR
	bOgWRiLVhR41CiXHzpRjPoulHsU9MmojKuqwsnN2M+IHe12ZWPUB+a1Q/pB/PiQO9BD+LtreWlH
	gSXAGqGyWkOgFWaFpK/pAmKyMlehLA9vkTyBdpYdL/zXT+axjFW57svrz/Oh6425pQfcPK7vkhJ
	zLSgk=
X-Received: by 2002:a05:6214:6014:b0:897:1e9:57a8 with SMTP id 6a1803df08f44-897279b33b7mr28266266d6.1.1770898508357;
        Thu, 12 Feb 2026 04:15:08 -0800 (PST)
X-Received: by 2002:a05:6214:6014:b0:897:1e9:57a8 with SMTP id 6a1803df08f44-897279b33b7mr28265956d6.1.1770898507944;
        Thu, 12 Feb 2026 04:15:07 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65a3cf38c5dsm1712289a12.22.2026.02.12.04.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 04:15:07 -0800 (PST)
Message-ID: <f1fc24ad-054f-4731-b982-4c579abf46c1@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 13:15:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: pm660: add thermal monitor
To: Richard Acayan <mailingradian@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260210021819.12673-1-mailingradian@gmail.com>
 <20260210021819.12673-4-mailingradian@gmail.com>
 <e72ede03-94cb-45c3-95e7-63dff0ca3888@oss.qualcomm.com>
 <aYvNX718diaXDsBy@rdacayan>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aYvNX718diaXDsBy@rdacayan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cd7fb3DM c=1 sm=1 tr=0 ts=698dc44d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=x7XoQ9lxPK0ULKPy1m0A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA5MCBTYWx0ZWRfXxBxmF3HbxQuT
 14bi72cF4/Dj1CWHzbBmXHpUafmIsB7xTX+Xk05636ZUQtEc0cTwGeZDbso7zFRo/boyGbfgeay
 h/Kl2dF2QOHs4BZECKSS0JBJ75NQu0eRrlfLCvGIo0/9+vk1UulPl89BXVrm6JzkMytAXz596RJ
 V0zmubmlBVCXSiNR5XAfSeg0z/7MtAITIk2jvX7qqUSmTUw3fvy7P+u+X05ZwSWgQDjtp3w/Ao8
 0ZufXCK+kkPfu8xjPq2SBAg//WwzYnjSH4jd4EeO77+DH6QI5D0tjYsdBuqjKclo8xoexG1bpOb
 JKPTUVA5gCvBpEdLguIz8iI6jEP0ZZeVQvDzYkpuzNovgtq+WW5HLLFQUQvCPTMjdIX44l9Oecc
 ziDRSzPOtjsHSMzCghKMz2GCWdOZaLTWcX+Q/5jZNMhvfklI6nRdXuiFUszMhm5e+BLYGX/9HiO
 6IILx6S/XBAtekbGODw==
X-Proofpoint-GUID: XkcC_dzDWkrnOulEBytzLq2oDaY5xVYG
X-Proofpoint-ORIG-GUID: XkcC_dzDWkrnOulEBytzLq2oDaY5xVYG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120090
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-92693-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,intel.com,arm.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,0.0.0.0:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_PROHIBIT(0.00)[0.0.13.72:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BFF1712D565
X-Rspamd-Action: no action

On 2/11/26 1:29 AM, Richard Acayan wrote:
> On Tue, Feb 10, 2026 at 10:59:20AM +0100, Konrad Dybcio wrote:
>> On 2/10/26 3:18 AM, Richard Acayan wrote:
> (snip)
>>> +		pm660_adc_tm: adc-tm@3400 {
>>> +			compatible = "qcom,spmi-adc-tm-hc";
>>> +			reg = <0x3400>;
>>> +			interrupts = <0x0 0x34 0x0 IRQ_TYPE_EDGE_RISING>;
>>> +			#thermal-sensor-cells = <1>;
>>> +			#address-cells = <1>;
>>> +			#size-cells = <0>;
>>> +			status = "disabled";
>>
>> Can we enable it by default?
> 
> No, the thermal monitor fails to probe if it doesn't have any channels:
> 
> 	[   17.728926] qcom-spmi-adc-tm5 c440000.spmi:pmic@0:adc-tm@3400: error -EINVAL: get dt data failed
> 	[   17.728945] qcom-spmi-adc-tm5 c440000.spmi:pmic@0:adc-tm@3400: probe with driver qcom-spmi-adc-tm5 failed with error -22
> 
> Triggered by https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/thermal/qcom/qcom-spmi-adc-tm5.c?h=next-20260209#n945

You can define the following ones in the common dt:

REF_GND
1.25VREF
VREF_VADC
VPH_PWR
VCOIN
DIE_TEMP
ANA_IN

as they're (almost or) always going to be present

Konrad


