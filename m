Return-Path: <linux-arm-msm+bounces-116280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rTvAH0+QR2oMbQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 12:34:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B9E701428
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 12:34:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XF25VBTj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HkKlrQqr;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116280-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116280-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A80423042D7B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 10:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98AA13D1AB9;
	Fri,  3 Jul 2026 10:31:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510E73C1F22
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 10:31:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783074692; cv=none; b=o9mGh8s3SBwN3GlRGnwgrCgYBYsn7475M4u6RvAsFeWyFVmMMz7MmxsfBuj5d9IORdD7jMuRnS78ZQ5R0/ojsq479nTONOSgshKGht/yk5MvmolHNRTKz/D1/ovzA+HHlY+hYNiwA+jR3n77Fpiw95HYcmV++JtxQCjucgskV5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783074692; c=relaxed/simple;
	bh=qiyzgDhFBvLQBInbQdAPGyL8srSytSEX42oOuQxiCH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nrurda4LCtwux4JDumjA+BTg3Lg5+0EtQjS3SdY1ahfmWGlPBQ756AKPo/dGefOFnrKHH0UCu6c9lv/H5DdGyYGKwk6CJAClcnWqs3ac1pYzTK6UDSoHCyIY0SFJ2+y+gU6gvS3WWz2BfssE2SLcbUxVsPW81E1wZyUpCWTHN14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XF25VBTj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HkKlrQqr; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663684bN3053370
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 10:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8sg/ld/I8qbw7uUnUsVl9AhVTb+2HSc9O79hpsKVLY8=; b=XF25VBTjXdW4rzLs
	Cv50XV/XSKIHVl2NDbWOZikEIzSts9CaNge1SdaskXgT77lLHZQRySRLceuSZw6w
	sjAzZuLbAQD7FDUUL/epyOXp7Ncz3eN8p3Olhq6f/Q/Dkm4dOdQZvpi7ALh3/drh
	hVifuvuDLxvcV2e3bfWznaqF1cFQ1GpktvjIn6Nspw5yZEpzzIPZ/lghhkTIjFrP
	rOxRC8MV55xl/RoDnQUUBN4BDqwTTU7jrwS88RV045BJEncNAdLoRDG9FG9A1gSE
	z8DXzKw5GEJ06tndCi1ST5hffPxVPH/zm3qfOUmd8rtPKoI6u4EgzzH7Fk633T2V
	wS+fdA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j00yb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 10:31:21 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8620ee0971so661672a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 03:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783074681; x=1783679481; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8sg/ld/I8qbw7uUnUsVl9AhVTb+2HSc9O79hpsKVLY8=;
        b=HkKlrQqrBMdzBN6+NVhyBsbfGgnL6ph7UyOPJSl7ZXDHjrWVR7qq41L+SAHP7hQ478
         lvjIkJsbACA6u/oCwrBp0gYJJ8kuCRskgbMgRUgMuufnDhgDVxgILMLoh3Z19YApN8+Y
         6qTtCZImnkvGqXs7+ZR9MxMYIoP7XolbnYr7c9E8utarakkHyGJvgKSFMg5jCkCDfHTG
         pGzLZLsJb3JemIrDJ+c8/qQdZ7GKvFN+pi70bQ+dY0CDUsN2VToZ6qbdG5JjQG0hOFlF
         jbS3fgLnI/rZFp1+9Xnw3XkFubV0IVJcE+Do/lQY79NoXkCaiazklJLGrrbFKf+1ZeWt
         tkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783074681; x=1783679481;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8sg/ld/I8qbw7uUnUsVl9AhVTb+2HSc9O79hpsKVLY8=;
        b=cJngzin/G1obIUa9dt4Ikxy4yBVJBP6sM6fOEtq7hQ8dSqW+Qq2m7zOPLVgCygLOeB
         oiuAWvyAj1AHLmokz5rcKzzokNtTR5tMx2N3rMkzcuA5sbiUNTjPzwytTJck2XyNKKB2
         9jncIRlc3JYiOguOSkqm27Y8G1j639hGy5BdXIotGtnFW0mxxu6drXj6NkNKVPbH98m+
         CvnKXnqEMvWNhKwdx8f0ZbYHjLr8iXHXIyHAwj9P9MIpYfKk5adv/4FgfcihBceRcFwZ
         mJQlrhXPcz6dTaB7FchsziRBbYIjgp5KFXVCL85xZ8gvnH3AERruJUytovrieNCCko08
         YX+g==
X-Forwarded-Encrypted: i=1; AHgh+RqQuCmh7RIzaP5nuyzEQFKsR7eMc2xAwElyUtG+DwU8uYdrfULKT/k0K0/nKHaq7OCLjPlz9aD5YkRyBuf7@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq1mg4GwAVsDp3lA46ZKjpNpTqCxoNJ6UhKwK0xGCKOGnPHm39
	rM4kUMSWfCgfe8yKGpGG7lRULSlKdNZc34aHDIQJUgoh80+kMs81VTJi974GqG87EBFa6luHRL+
	OFH0GR1DqJE+MLjxTQqWnKDp+WJjQbq/MooaSPiE8EBYi0J7YOWg0/6RFcBZ7JoD2nWQ0
X-Gm-Gg: AfdE7ckhEdDXD1WwLsCsZCe7u2/qdd9ntd+bZrykrWO8rIudSJVgvoLUaLI1ZouNNbh
	jdi14oac0QDpM+495WcqC8dWsF4jx3qA2zR6DnGtrvpj8JaSfKUR9IqrLTMLPo84DBybdnkyxb5
	zDAXPS1yYDubFrWZaEDT2jM2mcxIceARZ3nI6ut9qBtTONMBXoLV59N8iuoDYhO63Ma0elrkYjj
	qYxr9pPoh/4sw6KznPOit5vQjfGZuXVv5xcHDbsnR6jVzz/86+aPc22GB3Snz+ulSh5Y+IMbfYG
	x6A7YAK0y/wo+4+Tq9n4P225wveAZfFNHOPTnbLIgeax1q7b7ZkZXkTjQr7S4BOlaT+ByYsezqT
	XRoq64a+MQyLv47S3ZOInGJswAodIItgueqkTgIeMYg==
X-Received: by 2002:a17:902:da89:b0:2c9:e6d7:fbb4 with SMTP id d9443c01a7336-2ca7e85a856mr102663295ad.31.1783074680709;
        Fri, 03 Jul 2026 03:31:20 -0700 (PDT)
X-Received: by 2002:a17:902:da89:b0:2c9:e6d7:fbb4 with SMTP id d9443c01a7336-2ca7e85a856mr102662705ad.31.1783074680012;
        Fri, 03 Jul 2026 03:31:20 -0700 (PDT)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad71328d8sm7377295ad.29.2026.07.03.03.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 03:31:19 -0700 (PDT)
Message-ID: <faa65875-0aee-4a12-a751-084459edd4a7@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 16:01:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] dt-bindings: firmware: qcom: tmd: add TMD device
 type constants
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-1-3882189c1f83@oss.qualcomm.com>
 <20260703-bizarre-abiding-spoonbill-dcc142@quoll>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20260703-bizarre-abiding-spoonbill-dcc142@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 90aj8lRaTflWTrGlPSWmr2QSlOleqIVw
X-Proofpoint-ORIG-GUID: 90aj8lRaTflWTrGlPSWmr2QSlOleqIVw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwMSBTYWx0ZWRfX333t9WWQT/bA
 l46cNQzyWN6fDpL2r/c8cO86nx1yhe1SAdfxutUTIl0IIcU05vwt9aIreOCdeu+0+IFzNhPuCsI
 CtA8whHX/DbC1AhYASQJrlTUN2LM8Sw=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a478f80 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Ac_jkr_iY3tVM05H0rEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwMSBTYWx0ZWRfX8fxICsdeGaaf
 n/YzH+NU9aI+FEeuXFYO0bQ08j3BZMGNRf8JgQj9f+Tbtl1/J2w4H5ouVi6EF8rBoXyAP0+Bxnj
 zpZRcDH1LOt0WMhtBtTCRXyC5YOXN2rj3cTQb9eHTnRLnqytvpnCcbsG2WpItDkH+foZjZtvEpm
 ltiXFq0T449j48m5HkuLGObIIyt1SanGGvTjoVnpck7CTVPRLJWEu/e6rpECjT8lclV29uhm5Vk
 T09sxKaJonS1kbanoqNzu7IHTACAUBBQWW3z6e4lMK8M2cuJ4Sz5amsM5TOm87Ib/FSmw0GVlma
 2jStdIZyAYxIe6AzaDRRDtIF47JJSADimIXFj3/Mdrgy1IjCMZp1jfv028Joxy/QOK0ATm/NRrE
 ozfngPN2PHWOpKK5442pzWv8VFXKHN/23Wo+yJ8Ee5KRYvfcmMKjlDOctufelGCu0xY75uRo+Xy
 kmyuL/yyUapo0GlmbGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116280-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 49B9E701428



On 7/3/2026 1:22 PM, Krzysztof Kozlowski wrote:
> On Fri, Jul 03, 2026 at 10:33:04AM +0530, Gaurav Kohli wrote:
>> Add Device Tree binding constants for Qualcomm Thermal Mitigation
>> Device (TMD) types used by remoteproc-backed thermal cooling devices.
>>
>> Qualcomm remote processors expose thermal mitigation endpoints
>> through QMI. These endpoints can be registered with the thermal
>> framework via the `#cooling-cells` property on the remoteproc node.
>>
>> The QMI TMD protocol identifies devices using string names (for example,
>> "pa", "modem", and "cdsp_sw"), while the DT cooling-device binding with
>> `#cooling-cells = <3>` requires numeric device id in the form:
>>
>>    <&phandle device_id min_state max_state>
>>
>> Define common TMD device index constants shared across currently
>> supported platforms. If a future target requires a different mapping,
>> additional target-specific constants can be introduced while preserving
>> existing DT ABI.
>>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   MAINTAINERS                                 |  1 +
>>   include/dt-bindings/firmware/qcom,qmi-tmd.h | 20 ++++++++++++++++++++
> 
> Why is it put into firmware? What part of firmware are you describing?
> To me it looks like thermal thing and even you wrote: Thermal Mitigation Device

Ack, it looks better under thermal. Will move to
include/dt-bindings/thermal/qcom,qmi-tmd.h in the next version.
> 
> Best regards,
> Krzysztof
> 


