Return-Path: <linux-arm-msm+bounces-92454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gE1BFJP7imlBPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:34:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C168118ED9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:34:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E689304705C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 09:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A01B2341056;
	Tue, 10 Feb 2026 09:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gyN0gdRF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YdEpLmsA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8A833D4E4
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770715970; cv=none; b=nXx6t+HQR58KoM40gRKe9dmBFiXrdVtLP4BKepKH6KJa1JwdAHH2OiwVUtmnDBaM/D38ieH2rTUafRAwU0ShTIdRShjM5Ye/IfxOieXe7XwmVIos0g0uT9F7Dh4O7DuA0uIxVHcPWdiRNKtVYS//ixEdcur64K++y+ONrnnnK+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770715970; c=relaxed/simple;
	bh=lYXkrcgF/gfCqHIjWikYj3wuxE8pK3C+vUdP+nhK84M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OTgh4xpQ+rEkT3gjbUJyxS8xq2n46SiZG8whTYdefmd3UmCpdc0eq9hTCCJYYHMvssqrQ1x4xcV8CuijK3nC30xymuV1Oq4XpI8UY9tFoQqEIoVwde0t/hRj8Ct62pURzlF38TGvBCyvcTNqqCrIEQtVZm3t0hpxFzQlNIf7Pzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gyN0gdRF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YdEpLmsA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A7Zbcl1419500
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rLgXJquVUyBesXKA8dBPnaFYAdLbpSuCrTyxZs6wRLQ=; b=gyN0gdRFUJ97s+ng
	w9doHsRyEqEf4htP5kOOfdDEkdnknJuhCgyZofYt3++5xG6Q2jj+j80gvIrXZXq7
	rIGMjNBgpOy8+qvhQgro+ixrsVEdGl6ypCUHzgLTqBXvlmMV6JFqr3H+YYUFpKhc
	XpzWvOy1t+q3Pi34ZcxXG5ZTPwpCVPW3UntEPew9+94OHzMQ+1IB4P0U2UcilQ+r
	AOhWY7sX/DOyNWmZ9U067LepU7sqIUhxVLjBiUkhqABGxIUriGFKhN9yW2dO7Jbi
	c2tYVWDQw60hbqFST2xrQEGMlUmq2PI66KzRdyxQDtqBepaFU1klhTEE525WgIR7
	BGn/uw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7rpvswdn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:32:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70cb31bcdso105623385a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 01:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770715968; x=1771320768; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rLgXJquVUyBesXKA8dBPnaFYAdLbpSuCrTyxZs6wRLQ=;
        b=YdEpLmsALwtK6Pa72IecphXXMk4NG/g9EeFodmwCoRne0USv7T8S/0ZrlwnXtdLRb8
         eWrKxCfpYFZSw6Lc5XI8ljOTOK+JkOCZh5Spyb4Sm58jeXn6GimUGrDSHslF4amjxRy8
         Skz8+XMYcYNkLQ8Odc2aolxnqg2uTY1AodPL0Vadf0yMs1+c35OGNwW1YILT1+KkrRCz
         vCoqizHUumiXo1zkt8ah3b4r1G4DBAaIxyLqXkgBCRUze/WNiHmuzmKRrjLvSnvxFb5Y
         E4/Dkcqo2Oe74/oIOIy8Onk8Fuq2hA6PJnRQvXKxatvQuwCDa7JkMJHV3eNunEajVx76
         Nw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770715968; x=1771320768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rLgXJquVUyBesXKA8dBPnaFYAdLbpSuCrTyxZs6wRLQ=;
        b=NPzW9i1hNP7L+lMJiMzyuTJh1LcANP1WkPimgzlTx5fIQ6zR6AsSliw+RL2hehoNaS
         Fv8j1UTnsGp8gjzXs294rZ+nCQFVJ121YTbAklsuSh6lzi5S89X9q54uJQKV3BC70bqA
         1bVLltBWP1zf38VY40dIhYP6Nk7PeiMYduCy7UdDhKAgv0/1kTj28kOmoZT9OiQEiX43
         oVBMJgq7FiaYg46OGysxFcT5LiEtZVCGLaGp+d1rgBdZ8z2g5VQwTuvUsnVrSIcFE0N7
         PLKiPDEMWzfNRlZvPNJhMd20FXhLk2ycFew2OUKiQJZJ1CRPSlbhz8oedWiSvqo82l5u
         jlgw==
X-Gm-Message-State: AOJu0YzupT+jpzlNvFT/36VohiRinM/96DmZs/yktPR4WOY2sUGAOvNq
	2edf7mc7ocmm5DG86/4nuPeu1Pm2BGRXrEHWaJuQoicVvByNOz/hb0MhIgjFrxIsUJD5It2oKbY
	rdEGB7877ITJf1G9MxaOSfpr7r+khpZL7KbgoksLu7SO6xnsTxI+5i9xQE69oNp/3MlWj
X-Gm-Gg: AZuq6aLfq8eX9TRZ9gQrAhIuVrmLexmtJSeiszCnjBoEvyBRmJM8kNgVEAm5zmtKbmA
	AnopDLXiDX3YX/lD2BxtTXFgTVQZvaGXcm/YFEAVsmnxMz5V4sRnMflocBsyaZaMpu0xoYxuuN5
	RbDgS6C7zwVoMbPq8hEn1y7B9b7pwJXqXsa/je5t/0aowArw033EDRahEZYyThnivxBAn/WrDRV
	+9DzPF9SoeV/Ee5aL75wSZv+Ki22idnH+qFs3NbdIz9vONGh2y8mOPNZ8G+ktaW93RbrwZrg40H
	vzx+Et1FuO0JgB3KEM6brlng/GVSXiGBYXKtoeQnpu2x1g8zH2ZsMCIgIm2vSVrJ2CCBWP1pqUF
	CpRluZ9qcww/GCadD/sKytp+L8Oj3//yANiT1Vtuq6xrMyh+vPuYJ5seJxXb3NicsRih3kDTA9f
	42nHM=
X-Received: by 2002:a05:620a:1a20:b0:8c9:ea8e:c55a with SMTP id af79cd13be357-8cb1fed996bmr108852385a.3.1770715967948;
        Tue, 10 Feb 2026 01:32:47 -0800 (PST)
X-Received: by 2002:a05:620a:1a20:b0:8c9:ea8e:c55a with SMTP id af79cd13be357-8cb1fed996bmr108849485a.3.1770715967474;
        Tue, 10 Feb 2026 01:32:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edacb18aesm499346866b.41.2026.02.10.01.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 01:32:46 -0800 (PST)
Message-ID: <15b87c55-9dbe-4a49-b166-498908f174bc@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 10:32:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] mmc: sdhci-msm: Remove NULL check from
 devm_of_qcom_ice_get()
To: manivannan.sadhasivam@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson
 <ulf.hansson@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260210-qcom-ice-fix-v2-0-9c1ab5d6502c@oss.qualcomm.com>
 <20260210-qcom-ice-fix-v2-3-9c1ab5d6502c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260210-qcom-ice-fix-v2-3-9c1ab5d6502c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA3OSBTYWx0ZWRfX3o62ivZicHxj
 8OwHm8xAwv5u1pcZeA5991xj3eAkNh3ZDBlGRm500ordtpNZBWh058Qd4kK9G/Ur/noS8th9UNV
 5Tu46w3YB0y4ivpL6d9grXbexcpfD83Ocyt5Se5Ya4pb3MPgxysXVtEoXg/5d0/KQOEaZRQGIrY
 EOF0xH3E0gITlx8od3XJi34SBZyh8IMCT6MBchASjoJcquP47RvnJAl2guCmWZhV3pw3kgiRQzc
 z4Jw0HGuNMtzMx7u4dac3Gq7DWgRWbmD/gpSi8FxzRxtxiSjPsjpt718abH11/T35ypGtbrSaPZ
 +tQWivVLVN/AmELA2DuIt2XVTDyyf+evA0yQzxjUlc623dx2ZIOE4jYZrsSG0+4cj8ibupWN3ct
 /axJbtNVXelekPnCz/EEZhs9l2/AuZGcMPYs25SmQAm9FM7WMckQ5ZGQjxIJoTFk8U4XI/bJDr6
 FZXaxb3C9aMy0AcS4Mg==
X-Authority-Analysis: v=2.4 cv=KKZXzVFo c=1 sm=1 tr=0 ts=698afb40 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=AC2hTCgHVLFjDka4hzMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: HkPFzLJHDk4a2lPaSXSBOR1mdrrbqTEV
X-Proofpoint-GUID: HkPFzLJHDk4a2lPaSXSBOR1mdrrbqTEV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100079
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92454-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7C168118ED9
X-Rspamd-Action: no action

On 2/10/26 7:56 AM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> Now since the devm_of_qcom_ice_get() API never returns NULL, remove the
> NULL check and also simplify the error handling.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

