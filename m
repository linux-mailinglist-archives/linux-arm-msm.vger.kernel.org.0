Return-Path: <linux-arm-msm+bounces-90265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAeNEGmLcmlJmAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 21:41:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C971E6D799
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 21:41:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E0E933004430
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 20:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B75435D5EE;
	Thu, 22 Jan 2026 20:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h1PHpqoM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F9dFzATu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BBB2727FA
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 20:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769114467; cv=none; b=PKh7nV+Khp7B+jceWpHT7H1lQUloT+ivA5pvhX/IjuxEz7qEmOD/lYxKPqM+D7fYxqv3eUfJE9tASiNIwOEjv/AAdpwg+vc5p7gNzGxwcRqy7ytGeqQtz9ka34MIedeOktE/60mBHqJkxA9MLZrS4dCTIBS7mE6WoSYyee4YQD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769114467; c=relaxed/simple;
	bh=lrnppE3nIA+PsYR21EgLwMtIVX4jL+9qFPjYcDHCBr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IJBw4ll2VAhjxkCZA6E6CR9borvLTbSR2+I1Xd3puuva3UJZ9MRGCQImiufcJye7NKzfQ+Me2DmWyMuc6HgmlaiWl8esJ9dU4L5qoakx7iRKtpKasfhMbgctebwuXrZRK5AyvqD1bkEo5Nwa8TDxQTMYotmtsrs8ZtjA07OZj1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h1PHpqoM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F9dFzATu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MK7wjX3811447
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 20:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	At6RBSf5PLkuq5vt6TMegL9U5RwYiA5oeqLu+itdgaM=; b=h1PHpqoMwff/w+F9
	fPhzYNfvPGZVtHo/waAgcLbPe5KhMOqn4eqtGefUqnATfja6tGGNhwswVYvixnbs
	OP62S/sFqgvcUGHS+hAhSh14lN+EmG4mJn+qSv3W7Y/hDZMYErRjY8vXE3Raycu5
	fG2qo6d1pbkg099Bgp7zzbA5EWVDGQTen8Jisjqr8RAefXMfToPw0uNY5WUxDJX0
	onf6X0r51X4nNwzAW4yP8rCK1RuvDRc0AujUPcgqMXTkApQy54DZ1Pn387tts3xd
	XO/jJq7ni0pDZI9P+qk4Peer+gQ/6lCQDBwlFhvRXA41EJ6k0zyNYqEWf16uwFAi
	EAaFYw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bujq1a0n8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 20:41:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52de12a65so31102485a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 12:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769114456; x=1769719256; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=At6RBSf5PLkuq5vt6TMegL9U5RwYiA5oeqLu+itdgaM=;
        b=F9dFzATuF7YjgOHLTLlcE68YAloDEJrMTYGb9izW988Ola8Fr+MfYJPUaC8dbuFuDF
         vRDpKDht2mAkMPRNejjXRVKtBne30GWEjf/BZn8+YsxL66byaRxLwjg9PAM15qJrLk5I
         2HQVP69/inM2azlpX0terOWzN9qyexdhDj6/KD5M3tcLy9W7Telb4C5Fp6jpJ2K/T5hA
         eWEkVnR3h4Dd0FbAg6rHaCUrhFmVOsc7gR/IKWgUnGm1p20JErb9RQNN4bDuz2bKbV2D
         v55gnzRYMcExVCaJkOSuJgnbcXeSB4czydc1xN3XCedb99rpk9nlQmsZc+P8n5TSwnP6
         xeAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769114456; x=1769719256;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=At6RBSf5PLkuq5vt6TMegL9U5RwYiA5oeqLu+itdgaM=;
        b=XGh3KRMm+NuvLN7ChqIupHNNQlyvkoEoLJZ2N5e/07qCovbjUHfGNDvdIcOdmTi4SM
         UGFK3imOec8Ozogi313287NvVvw636pHxx+9yQglqB19dfMre16MDVDUxoPflCpfJIw3
         1KElmBvmu5A7Su7hDU4ZmX4Ol9ejHyCVXeS5BzYjB80hNmxxXIXkWhPfz2YJrgsgwuiu
         4E14F+28ZP0uOSrDC2Z5y0dQrnqJoM4BO5GUkeECUfOUUruln1P+riqaKoZWHdblRtQr
         8DtZ6Lk3T1760EzItZovP9V/uzsTVYttm3S4gDBaYkGvSLZej4Ye50yCPjVF7R5mvga1
         Rz1w==
X-Forwarded-Encrypted: i=1; AJvYcCWSlFnD8CRUo4L++3s1V6tr4Jsk1AJyzPb7kO7fSCUtc/OVEZ822aSY+Dt0+S/PMa2wCQQnMKn5StGHjz2W@vger.kernel.org
X-Gm-Message-State: AOJu0YxPvT1C1wUdWyiXsuMXm70TO+kwkVwAFIY1WWIGkB34cIA9ZGaF
	GKuQD9tqH7/Y8Ia9Pj3Qve8RefYYDxmOxWU0B+IRBpRUQOAmxvbG75nAPCynE7/Y4oisT+fwSwM
	fti3F5ZYM1UtTQgCs48DVhsdISW4EegHtKZlH1KCAxG32LjjdJVPaZ5Usilo8QiaU5IVA
X-Gm-Gg: AZuq6aI+4oR4nKkzf1gkrFHPloiiz5zTOaxjG4zWA4P+/LfNR8x1AcmhO+gF1zxatbD
	epXW45Y7B4lZp+Tdr7nE9W8d6ypSrvLeNl1AXHN9Swe5QjSpdFxh9jm4CC5829uBXRjVX9YL8vQ
	1IwCzhhpRhIO/L51oyT+xEaq3TNZsd4y6qD1NPSl7QYpqrGAlokejyknlhkbsz+Bffo46EqnKaA
	ZSyUkCTvmQO39MgYrnjDLqAngxQ6iE3utnTHVznHb7+r0QYEpIU3JuxEUJUlKumMc5WgZEcgMAL
	o1soSIxyCw1uUICiVuYACrQf3OTIt/s1kwXUoZi7gKYPABVJrdigOAELOKsZ1bM7sClRRoqeJku
	PB+3Uz296sM8MbZGHmQpTZJqaqdwBZIBwSmT4MfLEoygikEttm4FSmd9soZqSlLDSzwM=
X-Received: by 2002:a05:620a:1786:b0:8c0:c999:df5a with SMTP id af79cd13be357-8c6e2e31c38mr79737485a.6.1769114455812;
        Thu, 22 Jan 2026 12:40:55 -0800 (PST)
X-Received: by 2002:a05:620a:1786:b0:8c0:c999:df5a with SMTP id af79cd13be357-8c6e2e31c38mr79734085a.6.1769114455205;
        Thu, 22 Jan 2026 12:40:55 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b419288sm16929966b.20.2026.01.22.12.40.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 12:40:54 -0800 (PST)
Message-ID: <5a40a0ab-6c79-41b5-8741-c1bdcdeac617@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 21:40:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] arm64: dts: qcom: Introduce Glymur SoC dtsi and
 Glymur CRD dts
To: Rob Herring <robh@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Qiang Yu
 <qiang.yu@oss.qualcomm.com>,
        Jishnu Prakash
 <jishnu.prakash@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
References: <20260122-upstream_v3_glymur_introduction-v6-0-245f408ed82a@oss.qualcomm.com>
 <176910484203.3007057.6301998080301909826.robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <176910484203.3007057.6301998080301909826.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: C5wqARvDZIm-UZJX-vt48f62-EQsU_Sg
X-Authority-Analysis: v=2.4 cv=O480fR9W c=1 sm=1 tr=0 ts=69728b5c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qC_FGOx9AAAA:8
 a=gEfo2CItAAAA:8 a=_jlGtV7tAAAA:8 a=YXyXsvO4i0MbaF_IcjgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=fsdK_YakeE02zTmptMdW:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-GUID: C5wqARvDZIm-UZJX-vt48f62-EQsU_Sg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDE1OCBTYWx0ZWRfX3wSDWo+Kq7yq
 91WwAcq1R7a6IKCSTCo7cjQIqsehKRtynUAFOyBYBuwJWx2vEHP6wVakLl6KH+0RN0AqukmXi4i
 QG3AW2Xdo+4JtQCU8PCenU2ntevJS8PnC5ucUEvNVlerCqOUq5ba+pfxqfOoXkVXOoEyDqNzxxc
 C6ceAdJKBb4be0F7HVFxb9XOhc/fLRXpluts+f0spcYSCPI6uRQ73GYmem7h1pa1YqFVvyjmUF0
 sM0IXNsl2S0aXqtP/L6b8rQ0+GDo+I2rCLy3n6RiFsDkpJY/76lkuXvICWnX2uMEvo6wyS5ET/j
 wxV8JypTgYCA3cUF1dwQjafRKST+Y2xcOEDmWR4bfjwYer5R36QiFuNkroQ1LuIKkF9BP67VB0/
 5uYSCdkorFPGgZv8kmDOaQxdITp06aEnHJkapFV+JzQ79PErd86agKlZIJXtB3oFLgDI/2QFYeV
 u6Z8QeL/09JmOTM0nqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_04,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220158
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-90265-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:url,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,codelinaro.org:url,devicetree.org:url,1bf0000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C971E6D799
X-Rspamd-Action: no action

On 1/22/26 7:07 PM, Rob Herring wrote:
> 
> On Thu, 22 Jan 2026 20:53:57 +0530, Pankaj Patil wrote:
>> Introduce dt-bindings and initial device tree support for Glymur,
>> Qualcomm's next-generation compute SoC and it's associated
>> Compute Reference Device (CRD) platform.
>>
>> https://www.qualcomm.com/products/mobile/snapdragon/laptops-and-tablets/snapdragon-x2-elite
>> https://www.qualcomm.com/news/releases/2025/09/new-snapdragon-x2-elite-extreme-and-snapdragon-x2-elite-are-the-
>>
>> The base support enables booting to shell with rootfs on NVMe,
>> demonstrating functionality for PCIe and NVMe subsystems.
>> DCVS is also enabled, allowing dynamic frequency scaling for the CPUs.
>> TSENS (Thermal Sensors) enabled for monitoring SoC temperature and
>> thermal management. The platform is capable of booting kernel at EL2
>> with kvm-unit tests performed on it for sanity.
>>
>> Added dtsi files for the PMIC's enabled PMH0101, PMK8850, PMCX0102,
>> SMB2370, PMH0104, PMH0110 along with temp-alarm and GPIO nodeS.
>>
>> For CPU compatible naming, there is one discussion which is not specific
>> to Glymur, Kaanapali and Glymur use the same Oryon cores.
>> https://lore.kernel.org/all/20251119-oryon-binding-v1-1-f79a101b0391@oss.qualcomm.com/
>> We've kept the "qcom,oryon" compatible
>>
>> Features enabled in this patchset:
>> 1. NVMe storage support
>> 2. PCIe controller and PCIe PHY
>> 3. RPMH Regulators
>> 4. Clocks and reset controllers - GCC, TCSRCC, DISPCC, RPMHCC
>> 5. Interrupt controller
>> 6. TLMM (Top-Level Mode Multiplexer)
>> 7. QUP Block
>> 8. Reserved memory regions
>> 9. PMIC support with regulators
>> 10. CPU Power Domains
>> 11. TSENS (Thermal Sensors)
>> 12. DCVS: CPU DCVS with scmi perf protocol
>>
>> Dependencies:
>>
>> dt-bindings:
>> 1. https://lore.kernel.org/all/20260121-glymur-pmic-mfd-v1-1-2aab4f21e79c@oss.qualcomm.com/
>> 2. https://lore.kernel.org/all/20251215-knp-pmic-leds-v3-2-5e583f68b0e5@oss.qualcomm.com/
>> 3. https://lore.kernel.org/all/20260121110828.2267061-1-pankaj.patil@oss.qualcomm.com/
>> 4. https://lore.kernel.org/all/20260111155234.5829-1-pankaj.patil@oss.qualcomm.com/
>>
>> Linux-next based tree with Glymur patches is available at:
>> https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/b4/v6_glymur_introduction
>>
>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>> ---
>> Changes in v6:
>> - Moved pmic thermal zones to their respective pmic dtsi files
>> - Link to v5: https://lore.kernel.org/r/20260122-upstream_v3_glymur_introduction-v5-0-8ba76c354e9a@oss.qualcomm.com
>>
>> Changes in v5:
>> - Added opp entries for pcie nodes
>> - Dropped qup-memory interconnect from uart nodes
>> - Update trip1 type to critical for pmic thermal zones
>> - Alignment and newline fixes according to comments
>> - Link to v4: https://lore.kernel.org/r/20260112-upstream_v3_glymur_introduction-v4-0-8a0366210e02@oss.qualcomm.com
>>
>> Changes in v4:
>> - Enabled PCIe SMMU for all 4 PCIe instances
>> - Updated dispcc required opps level to "rpmhpd_opp_low_svs"
>> - Updated watchdog compatible
>> - Renamed gic-its to msi-controller
>> - Updated GCC clocks property to 43 from 44
>> - Moved cpu-idle-states to domain-idle-states
>> - Fixed alignment and zero padding issues according to review comments
>> - Dropped glymur-pmics.dtsi
>> - Moved pmic thermal zones from board dts to soc dtsi
>> - Link to v3: https://lore.kernel.org/r/20251219-upstream_v3_glymur_introduction-v3-0-32271f1f685d@oss.qualcomm.com
>>
>> Changes in v3:
>> - Enabled system-cache-controller
>> - Squashed all initial features to boot to shell with nvme as storage
>> - Updated tsens nodes according to comments
>> - Merged tcsr and tcsrcc node
>> - Addressed review comments
>> - Link to v1: https://lore.kernel.org/all/20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com
>>
>> Changes in v2:
>> - Series was sent erroneously
>> - Link to v1: https://lore.kernel.org/r/20250925-v3_glymur_introduction-v1-0-5413a85117c6@oss.qualcomm.com
>>
>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>>
>> ---
>> Pankaj Patil (4):
>>       dt-bindings: arm: qcom: Document Glymur SoC and board
>>       arm64: defconfig: Enable Glymur configs for boot to shell
>>       arm64: dts: qcom: Introduce Glymur base dtsi
>>       arm64: dts: qcom: glymur: Enable Glymur CRD board support
>>
>>  Documentation/devicetree/bindings/arm/qcom.yaml |    5 +
>>  arch/arm64/boot/dts/qcom/Makefile               |    1 +
>>  arch/arm64/boot/dts/qcom/glymur-crd.dts         |  601 +++
>>  arch/arm64/boot/dts/qcom/glymur.dtsi            | 5913 +++++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/pmcx0102.dtsi          |  187 +
>>  arch/arm64/boot/dts/qcom/pmh0101.dtsi           |   68 +
>>  arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi    |  144 +
>>  arch/arm64/boot/dts/qcom/pmh0110-glymur.dtsi    |  144 +
>>  arch/arm64/boot/dts/qcom/pmk8850.dtsi           |   70 +
>>  arch/arm64/boot/dts/qcom/smb2370.dtsi           |   45 +
>>  arch/arm64/configs/defconfig                    |    5 +
>>  11 files changed, 7183 insertions(+)
>> ---
>> base-commit: 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
>> change-id: 20251007-upstream_v3_glymur_introduction-5a105b54493d
>> prerequisite-message-id: <20260121-glymur-pmic-mfd-v1-1-2aab4f21e79c@oss.qualcomm.com>
>> prerequisite-patch-id: bd5a4703a5a7fc530418337680cf1e2ea1518f35
>> prerequisite-message-id: <20251215-knp-pmic-leds-v3-0-5e583f68b0e5@oss.qualcomm.com>
>> prerequisite-patch-id: 6bbaff642cfd1f1386ff0ccd746739b68cdbeb45
>> prerequisite-patch-id: e30603778b23b7f7586b1c01a362e45af7bd0aa3
>> prerequisite-message-id: <20260121110828.2267061-1-pankaj.patil@oss.qualcomm.com>
>> prerequisite-patch-id: 14469fd166b31b251b98bf25e783ab6f57ddd13a
>>
>> Best regards,
>> --
>> Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>>
>>
>>
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>   pip3 install dtschema --upgrade
> 
> 
> This patch series was applied (using b4) to base:
>  Deps: looking for dependencies matching 4 patch-ids
>  Deps: Applying prerequisite patch: [PATCH] dt-bindings: mfd: qcom,spmi-pmic: Document PMICs present on Glymur
>  Deps: Applying prerequisite patch: [PATCH v3 1/2] dt-bindings: leds: leds-qcom-lpg: Add support for PMH0101 PWM
>  Deps: Applying prerequisite patch: [PATCH v3 2/2] dt-bindings: leds: qcom,spmi-flash-led: Add PMH0101 compatible
>  Deps: Applying prerequisite patch: [PATCH v2] dt-bindings: dma: qcom,gpi: Update max interrupt lines to 16
>  Base: 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b (use --merge-base to override)
> 
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
> 
> 
> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20260122-upstream_v3_glymur_introduction-v6-0-245f408ed82a@oss.qualcomm.com:
> 
> arch/arm64/boot/dts/qcom/glymur-crd.dtb: pci@1bf0000 (qcom,glymur-pcie): compatible:0: 'qcom,pcie-x1e80100' was expected
> 	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml

+Mani you sent a 'b4 ty' for this months ago, what happened?

https://lore.kernel.org/linux-arm-msm/176189884156.5303.14323602106505981794.b4-ty@kernel.org/

The ipcc one should be handled by Rob now:

https://lore.kernel.org/linux-arm-msm/20260116162057.GA1681736-robh@kernel.org/

And watchdog is perhaps in Guenter's queue

https://lore.kernel.org/linux-arm-msm/de7f0b8a-a355-42c1-ac3c-d0b5de754711@roeck-us.net/

Konrad

