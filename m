Return-Path: <linux-arm-msm+bounces-113390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lIOSCSw4MWryeAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:49:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4D968EEA2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:48:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=p8eKmwdG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KfbQefSB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113390-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113390-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29901300FEDF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEE323BB11B;
	Tue, 16 Jun 2026 11:48:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36FC27BF93
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:48:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781610536; cv=none; b=e7OCLMYAq3j/bYBjBkkh6mSGzavTGctXUEaIIQLgBRzNatCt+XohgfkKCyV2FIL81hx20yOVsqCXZj1XrRPZ9M6af0TEBIf49qEdG6VmEzzUhpR+NhBwUMbNefW8RF9/i2szoRyVJHMK59CMf/MIm/O+5pA8KbMMhB+L6i8mTjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781610536; c=relaxed/simple;
	bh=15xU58OlGIe6NZ7kZabf59KZZFo2tPxWCldlwPceBHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H50xWy0onimjsJDphMaAnvcRNq6IyJ6pk48XM08Hy5iML8Fvm56uzRxVHVQ4AhPmxLgjRU1tH7vsZOQN30EMp6cBND82MWUg5tY3dX8VIJ4/Od0yK7Jqne74JltfYN2UeSsgVD70EeOSYRYatv2F2ouIXr+fRhs/rkGyoOhpPD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p8eKmwdG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KfbQefSB; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GABs5h3384266
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DT5yAnIAh8c6v+Wm2Kd7qlE74pTk+JCxmf+VxGo5m1U=; b=p8eKmwdGkgEl/7tx
	CfDzlfo+BytghnKd1Cuc5kjfqBWGdD5SMCPwz3J85v67L90fOXAqy9OKPoHAuFdI
	tKqg224Js2YhSaFxhQ5n+lyzlCe2jWYd7IdU85tigvY8xvmfO+/lEH9t0LvQlxis
	apisIuqsjOB82rixad2PAO9MKe2Z67nKhEvnMphw6Fb4sifojUmac/Yzr3T1a03G
	rjouMtaKb5/aNsTQH6vXD+FQ1MA8N0flD5rSaS4EttDxATxC4mXwlI82m57Fccvy
	Q9Y2YYuMVHAyyO21N7fSwmuEbE812FqgBFf1O4C0vy33q+NxOiv/C9iSKo7YoZxH
	G00R2g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1ep97um-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:48:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9157b3e5182so15427685a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 04:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781610534; x=1782215334; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DT5yAnIAh8c6v+Wm2Kd7qlE74pTk+JCxmf+VxGo5m1U=;
        b=KfbQefSBRj9nDchFuL5y5Qf1wzTg6JG6eqOmZ+cybX7ancOhh/MsYlPBdezlvZUOjU
         gyqEckS8y91IuMPQClvfOTBBiw+Z03ndXfHwb20YQ5/wDIdspGHrXj6s+0y/0aob7mXs
         6MzeRSvHZI9UYdG9MO1IP4aIMn9OjivAyfJuwrYBKL2sW5YY5OtQZjgfoo64qRoA8BCK
         bEZOEiJqOjnWPBPJ1vwq5CIUWRPO6nzh3gin6R0KxPApbmL7MKeVJ/TFLSt8+MwTcKFc
         TKKIxpE1cwFccCIO7T66GF1pz03KJEU1HRs58yB6/neCzhRMJeGGWJN5SFdySxCsksPl
         nopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781610534; x=1782215334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DT5yAnIAh8c6v+Wm2Kd7qlE74pTk+JCxmf+VxGo5m1U=;
        b=H4Vz0ZTCu+FE+0z6dTsELGF9Z/jlq6molEB7mP6ZEWVvdAgHSbv48bL5zc1kynRNZ6
         cFF7bnXIH/nZJrJs8xu5On44Z/fowOT71Z0V/DvnliIcO5CKNnzTNP7yV1llLJh6xYf6
         M7AZVMtLUVcZ3Usrc1dZzKM8ywd4bHu2eo20ljT1wHrruMmPP3oBjyPbVs+RHgC/Epwm
         oEOCi+fVE9OiubqwVCTejKe00WNC/fujKN42fITAJZnrz5LVjManfUZvxAotELotZ9Hm
         uDzBdxyRq1PkN4I7l4z22Zg2mQ7DT3lPLtsk61n18oSNja+A0FQjnrmA7HIXIQ+KDC/C
         kpKg==
X-Forwarded-Encrypted: i=1; AFNElJ9vyB6jF7i9wGrVok2jK+wTDHfs5Ww78mwse/H0CJITLLNDRVpxNLSOD07+n1w92BsiTd37E1zCa+3jCbXg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz71pQCeCE9/MvPqPoL189966ERsIwGRFKDq5Q+u1Ws0qVKOo9B
	DC1abIS4snqPJXRpcWdKuXwC0yrtdgy/FeeHbQdRDOUAk8+MnKlow4mXW4eOE68qLnOJR1o5yP2
	U3f7sTKdJ4oNvURJb08i5eZS8lI2pAIYRBhy5bp0XBoUApC3COtgMhmoA9l5/u8drxmdy
X-Gm-Gg: Acq92OF1laIKiXGlsLmSMXB7uoRtm/vjHFTpGVZ884iXwXxExJXd711oZPjKDQdpm0l
	FAQfBSXrlRkK5veJQDdjlOhqdDLu2sdkk8JG7g2Mufm/9BKuZSzgj59TUDjRqct9GGfm1oueMgb
	42k0nrlewqWOUi9XspWex49nKAhOxLiugieUqGUX2A9fekU6nrBZTdG4Wdvivdwo1UgruCxaqa3
	/XOeLawevQxW/0cbmIWs3NAw3VsT0cefPhRijWPYqH1ng2MoMw5og5nLIEuLVCul1HIt0nExUE4
	woFdgPb9N+OQXHFyp9J+TwWDtDh6fRVEnMe2wQErNp1k9LG3DUdnbu+bf8awInrXTAUaxAt2Kfe
	jy3fbzz3cJpJOBe/cARuFbchXKJdjo2ns1F2jq1ud2Q1/zA==
X-Received: by 2002:a05:620a:171f:b0:915:2b2b:fbdc with SMTP id af79cd13be357-9161bace098mr1809786785a.2.1781610533826;
        Tue, 16 Jun 2026 04:48:53 -0700 (PDT)
X-Received: by 2002:a05:620a:171f:b0:915:2b2b:fbdc with SMTP id af79cd13be357-9161bace098mr1809782085a.2.1781610533341;
        Tue, 16 Jun 2026 04:48:53 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb442083esm637095066b.3.2026.06.16.04.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 04:48:52 -0700 (PDT)
Message-ID: <06a264d0-6a14-4b71-b783-82b771f04411@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 13:48:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] regulator: qcom-rpmh: Add off-on-delay support
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Saikiran <bjsaikiran@gmail.com>, broonie@kernel.org,
        monish.chunara@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com,
        nitin.rawat@oss.qualcomm.com,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: lgirdwood@gmail.com, andersson@kernel.org, konrad.dybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
References: <20260127190211.14312-1-bjsaikiran@gmail.com>
 <20260515111647.qg75thdvcbvvjpoi@hu-kamalw-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515111647.qg75thdvcbvvjpoi@hu-kamalw-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I/ZVgtgg c=1 sm=1 tr=0 ts=6a313826 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=tAkNNTVKMvv2VOvRsoYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyMCBTYWx0ZWRfXyLSx/BiWEaXL
 5QNfBklSjj9TYG8xvxx0cp5ZqyAiJ3v0Pcr5aJsFR4DKeSaCI1Hx6oyCPrXhyBCwPaeLgGVFk/Z
 Uv53H6xfPfpUBmL/5crrOTxTzXWQURE=
X-Proofpoint-ORIG-GUID: JHM1fbXlyuD6Iy8L6T7f85D_NDUAr3Qm
X-Proofpoint-GUID: JHM1fbXlyuD6Iy8L6T7f85D_NDUAr3Qm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyMCBTYWx0ZWRfX5MGkBdRSuG1p
 M6Fg3ATRSX1FYyMlo0q+yLBiy1G4KprVeh2qFhG+W5kcWzSpdYDSzi8xsaAv7UaelP6WhQw+xJn
 Rkc4MANyjdDwuPdlHb0JbiF7KYmRapAJfzdNsLAu0cTqVKQVkCNAmWh/sCuwVAZGpHt18umtyle
 rVz3jPEBvQ4kIkwrmSU1jDYOE2J5HFANLg0yLnBLo9PhynSld2fM07K2r/Owp3dG+0AGF5hB60s
 kigFcSAG3UhJUkTOhaC5AzJ2gCRwKxczb2YYwCNc/BZ2fbW4jvmWD5cfwBAutJTbviYTym3UQQp
 rUsTHUudMJr4UpsyOECo/z10A9dX7HuRkr58SeBCLjXOY2+xLWAmHb90mki2xeWeBcUodsCVez7
 Dw3DOCrNsdKyJX/DvVqNGRPPGVQ4IK8UvUhT0h64j/jA/aAEYER61DiaH9dmLR1PHrBlisOtblq
 4CIwSXQ6s7gS8CjzX4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113390-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[qualcomm.com:server fail,vger.kernel.org:server fail,sea.lore.kernel.org:server fail,oss.qualcomm.com:server fail];
	FORGED_RECIPIENTS(0.00)[m:kamal.wadhwa@oss.qualcomm.com,m:bjsaikiran@gmail.com,m:broonie@kernel.org,m:monish.chunara@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:nitin.rawat@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:lgirdwood@gmail.com,m:andersson@kernel.org,m:konrad.dybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F4D968EEA2

On 5/15/26 1:16 PM, Kamal Wadhwa wrote:
> On Wed, Jan 28, 2026 at 12:32:09AM +0530, Saikiran wrote:
>> This series adds support for the standard `regulator-off-on-delay-us`
>> property to the Qualcomm RPMh regulator driver and updates the
>> corresponding Device Tree bindings.
>>
>> Motivation:
>> On the Lenovo Yoga Slim 7x (Snapdragon X Elite), the camera regulators
>> (LDO1, LDO3, LDO7) have large bulk capacitors and rely on passive discharge.
>> When these regulators are disabled, the voltage decays very slowly. If
>> re-enabled too quickly, the sensor experiences a brownout and fails to
>> initialize.
>>
>> Verification:
>> I verified that the core `drivers/regulator/of_regulator.c` does not
>> currently parse `regulator-off-on-delay-us` in `of_get_regulation_constraints()`.
>> Therefore, the driver must parse this property explicitly and populate
>> `rdesc->off_on_delay` so the regulator core can enforce the constraint.
>>
>> Changes in v3:
>> - Added Patch 1/2: Update DT bindings to allow `regulator-off-on-delay-us`
>>   for `qcom,rpmh-regulator` (Requested by Mark Brown).
>> - Updated Patch 2/2: Refined commit message to explicitly mention the
>>   passive discharge and bulk capacitor mechanism on the Yoga Slim 7x
>>   (Requested by Mark Brown).
>>
>> Changes in v2:
>> - Moved the motivation/context from the cover letter into the commit
>>   message of the driver patch.
>>
>> Saikiran (2):
>>   dt-bindings: regulator: qcom,rpmh: Allow regulator-off-on-delay-us
>>   regulator: qcom-rpmh: Add support for regulator-off-on-delay-us
> 
> Hi Mark, Bjorn, Konrad and all,
> 
> We have another UFS issue on QCS8300 RB4 EVK, where it seems this patch is
> helping.
> 
> Issue is seen 2/10 reboots and it happens in the UFS probe defer path:
> 
> 1. UFS probe takes regulator handle for VCC(vreg_l8a) of UFS host controller.
> 2. UFS probe enables the regulator
> 3. UFS probe defers (due to some other dependency un-related to regulator)
> 4. UFS regulator disabled on probe exit
> 5. UFS re-attempts probe and re-enables the regulator
> 6. UFS init sequence runs -> UFS NOP OUT command failed (no shell) 
> 
> Issue Log:
> 
> [    6.583836] ufshcd-qcom 1d84000.ufs: ufshcd_verify_dev_init: NOP OUT failed -11
> [    6.592780] ufshcd-qcom 1d84000.ufs: ufshcd_async_scan failed: -11
> 
> NOTE
> - Issue is not seen in first probe attempt, because UFS regulators are left ON
>   from bootloader, which gives enough time between rail turn ON and UFS init
>   sequence start.  However in issue case, it seems re-probe is happening too
>   fast, which causes init sequence to fail and UFS brownouts (similar to camera
>   sensor case)
> 
> - Also, we compared this board with other RBxx EVK boards for UFS rail, it
>   seems that this board has more caps on the VCC regulator, as the board is
>   designed to have both EMMC and UFS, and we have DT option to pick one of them.
> 
>   So for EMMC those extra caps were added and they are impacting rampup on VCC.
> 
> Since this is not entirely a UFS part issue, but a board design constraint, it
> seems better if we handle this in the regulator side itself, as adding it in the
> UFS driver may not be acceptable from UFS reviewers.
> 
> Please share your opinion, if this seems to be good reason to accept this patch?

Is that board in production already, or is that something that can be fixed?

Konrad

