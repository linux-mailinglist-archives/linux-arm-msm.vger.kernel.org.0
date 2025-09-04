Return-Path: <linux-arm-msm+bounces-72041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14284B43A2F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 13:32:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2520416FA25
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 11:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB84E2F83C4;
	Thu,  4 Sep 2025 11:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WHQKgyeT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65ABC2EB84B
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 11:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756985501; cv=none; b=Dh6UywaMVrjsh60BRPNfKjY2Fgjx/OYn/YaMKlEcwKrEkOYvGMMRAJ59pyYWtQzBQ7aB/43adpRx/qBIWIrVvdPHnC97cfpr7PIJ7DtbdG5rHXSGrJEQ2SqdRJv6DMeHXGKlXZndjEob4Ns+V+CSxzEaO23ITlBDlAgDflXKipU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756985501; c=relaxed/simple;
	bh=rAALfnxHqaKhs2dQnETIE/DfrBgOvyDsTDw6hkeBqbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=USJSYJZuPLfM986yiy3s1iPvDV62eusc7q4Tat97mD0ZsG+rKN67pKGZBu7rWSPBSz0mhbxQo7Yn/HAG50zDWMKtsjVgkbsL6lgDtiwXVJxkCqFq0v0wGsMSipOnleo2lfXU08B4V0AvKeFAHZvoGWigRI/K3nUlBWzZeel6RZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WHQKgyeT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X8ec022162
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 11:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2oM+3LmCQmXmSWcFdN4jFgLAQvHu68nnOGl7gbFhODY=; b=WHQKgyeTJA+t0hdF
	Y3HsIk40d6AMq7msZj7vQoxY/OX4XyA6gC26VqCWb3rNsaPIruX6D72AAyZqk/E0
	MZb1/e8MWYzTOoogj+JpZ8dnIE0la5OBW7GDq8hIhfuWQmo9SzbvlHCmCMmldEa7
	hcIKmat8z1/sKrSwL3EEcYsWDfRsL8ozoDCSicNeA2AkRM1jZiTJQ0VWNSa+xKW/
	5MfWP4coxyEUpK2C6NycMVV1u5nW1yzJ5wLYLR55g9LCtTu/pHGX55x2OoQKrnr+
	hZch4Z+KRBwMUxlaIaCgjW5y7tiGC0KyEK4xO5cKmtBbGhamjDbspWTAfyqOoalz
	Gdh/Eg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk975b9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 11:31:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b4bcb1e32dso3772581cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 04:31:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756985498; x=1757590298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2oM+3LmCQmXmSWcFdN4jFgLAQvHu68nnOGl7gbFhODY=;
        b=JQuExN9xvk+ghRxssatUBni4L2Ulb5FccJMPsaGdxXfnver4GbYXxapDuAL2cp3U1x
         lLdwSYpjDLRczi3daplluF2+yLlfpivCKrfNn5BEEfYedfod0Ev0E8oCe2NcTKw/Xr9E
         Uj8ASSLFtzzghHKSwRF/B1EIbVAaenyoNrnZ6tooo6OLfW2sTHMtTZ4NXtLEpEOGpDdB
         xckIF3OBCJFBR38VVzX5xFxyZ/QBIiWbaQXKCu9uWTFDBAA5t38hgDZj512AyllTelSm
         PU4PTPM51RoOVn5tFafOh0ljkSDe2Xqs+xV4qmu28zVLSF+edcJC6m57H/YDkmgkKt/H
         wiQg==
X-Forwarded-Encrypted: i=1; AJvYcCUDYkZ4/E+4MBtx57daHQ1PFcyy6yVATA7KhLJT4yfTV3pssk22a97YuMgCDvIOHvKtSrPEyc/jHnYD+awi@vger.kernel.org
X-Gm-Message-State: AOJu0YyAUChMaHAAFBfETw814O5IgNEq6idc1EATXcsP/z+UT+fLuqRB
	P7Gf8za9ah3JlHhBzIVfVuN7JmtWzQBZ9BV1nBkTKowUFrmiqpFV+51YezaNXQL8ytwAUH+I23c
	W5NuEvsR3C7W/mHs2m7pldDXDTlon7j19eWyCKPqKq1XXyUbH1u1uEtwXyoScDZ25z/gd
X-Gm-Gg: ASbGnctV4Khk9LK7ikwy8ANVJTIfdXsM0CcctzbucOjtqV1XOw6ClQHt2aNeJxOP3Oo
	r6kkMLb++wpJcM8jKNRH1AxtNMfXN2buz0PtUT5uKVcPBmZtIseKRsh0DBhsnBC4RnvYUgAEqPY
	mahfkGq9TkMIz432clBsFRxSbsWu88iIZkyeqdCgynxpVNZUTjiyOniQUIjBQotkkl8kVYV+MA7
	LVkGres7xqMwRcpDIw1Xl+NLUi2qjjReXpLlyQWibXMLAdTmMkzpDIWgrmsoumB3X236oV5+4zq
	ncrdfxCpyzDe5dtSa+gXJu/s26cgWN6Iuu73F7XlPVu40L8ryBq5WCR52qABvmH+DgkvjATwdu0
	yTdE22gZUGnxL8o9y+USNiA==
X-Received: by 2002:a05:622a:189d:b0:4b5:d74e:d938 with SMTP id d75a77b69052e-4b5d74edfeemr19082121cf.7.1756985497879;
        Thu, 04 Sep 2025 04:31:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyimratG0v0rJZ9h4moU0EjyKA3wUxFmTeJvP/OBPnaKd0KPhuJvcfVyUHWIHJApnY48UUQA==
X-Received: by 2002:a05:622a:189d:b0:4b5:d74e:d938 with SMTP id d75a77b69052e-4b5d74edfeemr19081771cf.7.1756985497411;
        Thu, 04 Sep 2025 04:31:37 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b047909f504sm206421066b.22.2025.09.04.04.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 04:31:36 -0700 (PDT)
Message-ID: <a547ecce-31c7-4627-ac6f-aeeef81bd0ff@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 13:31:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add support for Gunyah Watchdog
To: Rob Herring <robh@kernel.org>,
        Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com>
 <20250904001014.GA3405605-robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250904001014.GA3405605-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: G2NMvCN3SAqO0Kxio-9Fz_fl-OnJ4fEf
X-Proofpoint-ORIG-GUID: G2NMvCN3SAqO0Kxio-9Fz_fl-OnJ4fEf
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b9789b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=dyZUlkJkdh-3oYjz4Q4A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfXy6mVkxZ2p3w3
 jFidNj0t7OOMe0x0RJfKjK6FetqqMpQy1DbEshp3aoW7bit8p9OXUB3tRXd+jo1VMTSk/SKVin/
 oX7U8Hp7A3IjdGlqeKCzt3lA+wCRwBMhKrlbs/akDhYTWg9EjmK7mPJV2EKiQIQeBSp1jsKdUHJ
 gBC/ZTDe6Pu4Jn0WRY+GBSZZ/vSMCH8AMeFAUPfzfrbdrShg5A7eGiwo6w0bjPN1+QWX1sKL5cJ
 Z0+uxuXPsVPGEiQ1ucpn09pPUMcN6UG0J1lcoDWQ234DHGoAXu+JcTahJ6y7ssor+YX/Awj09pd
 RXSFboYYMQqAKzZ1Opa/10rXlJTqLZpMoJFhzwWOsqASeTMWP699iilnIWL4u/czuzVj2DhtJ/c
 CwQCaPCv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

On 9/4/25 2:10 AM, Rob Herring wrote:
> On Wed, Sep 03, 2025 at 07:33:58PM +0000, Hrishabh Rajput wrote:
>> Gunyah is a Type-I hypervisor which was introduced in the patch series
>> [1]. It is an open source hypervisor. The source repo is available at
>> [2].
>>
>> The Gunyah Hypervisor doesn't allow its Virtual Machines to directly
>> access the MMIO watchdog. It either provides the fully emulated MMIO
>> based watchdog interface or the SMC-based watchdog interface depending
>> on the hypervisor configuration.
> 
> EFI provides a standard watchdog interface. Why can't you use that?

The use of UEFI at Qualcomm is not exactly what you would expect..

> 
>> The SMC-based watchdog follows ARM's SMC Calling Convention (SMCCC)
>> version 1.1 and uses Vendor Specific Hypervisor Service Calls space.
> 
> Is a watchdog really a hypervisor service? Couldn't a non-virtualized 
> OS want to call a watchdog (in secure mode) as well? But I don't know 
> how the SMCCC call space is divided up...

Gunyah traps SMC calls and acts on a subset of them, passing others
to TZ

>> This patch series adds support for the SMC-based watchdog interface
>> provided by the Gunyah Hypervisor. The driver supports start/stop
>> operations, timeout and pretimeout configuration, pretimeout interrupt
>> handling and system restart via watchdog.
> 
> Shouldn't system restart be handled by PSCI?

I believe the author is trying to say that the watchdog is not
configurable from Linux at present, and if the platform hangs, there
are some indeterminate default settings in place

> 
> Why can't you probe by trying to see if watchdog smc call succeeds to 
> see if there is a watchdog? Then you don't need DT for it.

There apparently isn't a good way to tell from a running system whether
Gunyah is present, unless you make a smc call (which could in theory be
parsed by something else, say a different hypervisor..), but then this
patch only introduces the watchdog interface, without all the cruft that
would actually let us identify the hypervisor, get its version ID and
perform sanity checks..

I would expect that Gunyah has the necessary provisions to inject its
nodes as necessary, at least I recall there was some talk of it in
early revisions of Elliot's aforementioned patches:

https://lore.kernel.org/all/20220811214107.1074343-4-quic_eberman@quicinc.com/

Konrad

