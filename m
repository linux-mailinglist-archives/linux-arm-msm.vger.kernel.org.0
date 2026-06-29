Return-Path: <linux-arm-msm+bounces-115169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aybkNeCEQmrq8wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:44:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2876DC32C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:44:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fVGZiIbo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=J5FIdkXZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115169-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115169-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 155923115010
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D94416CFC;
	Mon, 29 Jun 2026 14:31:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B163B4EBD
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:31:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743519; cv=none; b=g/UK0frhoHyCOZ4XGHPcJjtrDNGjZCVaqysVHvFFVw6ssdTWdCWJC2t+4TPAC8yAuVG275uuEdNy0G6EB18tXx+JbwPcXqO3XOl5iJ1I0fBnnYWfAyRTE8szPbGPu6ydnrz2etDdP7QXi1rhng3i5MbYvOEbwr3UG30lIWepVS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743519; c=relaxed/simple;
	bh=0XCB7De3/3UmkyRVbH9S/Q+7qzzvs8n4+HeLrSIM4rY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V66fWLmSUYUMx+p2S8lua1Y+1EkPwVQMfJGk4sOSe5dWd4tr5kad5KfqQx0zaR3K7yemlGS+LE+4eSto++pbQG4JsGLdbQ4PWz+wDsJQbJo9tLmuPahKxZyHxVsYr5lYEXKE55qX/f3Z8L7zKc5KzHTXGQwPvaFw1aSQcMW+hgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fVGZiIbo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J5FIdkXZ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATKYq2579321
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:31:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MYh7cIP72DN2R7IDyMw5swr101H9ibCpywVjfyuBqxQ=; b=fVGZiIboijZ6fTYw
	suniisXUBIqPqHJ125RaQHLiysKolr3+rGP5YxBt7WAK9bajjPCjkWPTjxqAxPmj
	tdYAhes6KJBXRQ7PyT57dkkPPN3aM/KR8DLrSzvVvfCXREtagSEvi/RBCYEeCdiB
	OkEHmc36ytSYbzeSB9ZP1gaUYa5TW3ZzFokKegQFOBo5bSquxCQzsk+nnyGy8S09
	dchZGoBGK/qFJR9Zs6RY5hcxfkJXjUzsz46qlh3DAwBmreELanSCg+5i/FTGSfRh
	xSItycfN6JKPW3THNIj+eCAo6FLOxFLhj7vKG4uSOn2kHkZ4ocv8dpLq0w0YREqT
	R57MRQ==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7htkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:31:56 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6a14a3ef8deso4164592eaf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782743515; x=1783348315; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MYh7cIP72DN2R7IDyMw5swr101H9ibCpywVjfyuBqxQ=;
        b=J5FIdkXZNGUp1qyvsYrbHOLUUAjsnga6plX30hUBUKjN3d8tbUAYYdRswTidt2ycMQ
         4UIB6vVUhxhOGu6MHzB3GC6SLS2iO1tO2d2ibbFiH9WwcK60Bx+cT+XwoxZRdkQAMpvI
         WZ1JSLKKWZ8tdqbCCFC7dSSaigpqEwdzzFCgKW724fmVzgMEkZRIKFBrwDeieuqZ6gVQ
         N4fbWvkxR/CKX0sIpGNsRVWSommIHp0+0rX1n3L1Joygc0GLNKu7x/crk9aAmqOlSCmF
         KIjj630sNyKCUDMfe9UQz9sfprSCKqndrCGCNfmXeld2PmnAjDmG3jvphgqyMMAqeI6m
         4WJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782743515; x=1783348315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYh7cIP72DN2R7IDyMw5swr101H9ibCpywVjfyuBqxQ=;
        b=KWA3nvI2shW8svGQctjBwquVHuuHkCPefkEoK9txrZX8gFVnKof5AxHXma7d+Z9DQt
         HRaPMIYbHAYzsL+7Rru2BqB5P+6rxnPnq0oYZE3na5RRst1ddnuPJNJFM+T8ICf/ss5L
         GDgVTKpiadPVDRGWW9M5KlgkXwqWSoOYG9RrBalU9CZF/bxtckVL2rbWCjnRNTfFcduR
         ywW9uqIylibLWCAwDF8GBZly3tTR7ddAoeVKpZlsqSlDPl31rbKMJOdKYMxnyR55faB/
         ITcvAoA0OqgT8ZXIa5MHVCrydsOhkWPaeJjuT27692Uq3pZ+VhU7zNMxOcUn9xTiY03f
         Ewng==
X-Forwarded-Encrypted: i=1; AFNElJ+zLsxYRg2iKiOdztN1/kW7V2HCKNV3OWXBzT5Rv1R8U40ezgyChSePU+Vgb1tQz7ddvVaYcnM0L+S5a2EO@vger.kernel.org
X-Gm-Message-State: AOJu0YyaxLRJlTeD0Ss26lpthLkFC43e4FNUd6b4dpcgS2MoN9fgEDFT
	9X+hOhZj4T0Ym7Ni9WMzOdfpw0vr9XYSCHOJ5wF9lRLGrX64Cjif5w4qXGN/6U0bgjst3Fx8L+l
	DzYSGFdXXwf+P78ivmfRx9Pdy1MkTwYV2usHdbeecA7QVt4TjaeUXAqlRwUZ9/V9pxvby
X-Gm-Gg: AfdE7cmMjALY8KiO0ZsuUNIaXGJQmgJ9LQa4GeYXwjHRYJe34l3mzXhuyy2EZ/6fmAx
	sz3qruAV9sF+yTO2B8qBwqADbr5XV+216M8n/DZMmii2l8jBndSYbm7E14uruiBYXF0LWXXJpAa
	1VAYUzTkF1O0HaKuj1wRYv416Qk54muw7z8yYyEyWEnbz8b2QfCPsmOhr5VwmlzGswStXD+59K1
	wDHzRVP8fwIKDQrgJuIfPixTnHG1FDMLj7Vrcy3ioWcbEjogcNQgY+5Lf3LEFNDqDbIMd2iSAIa
	fQe7lMLEqTNmDwU/V8pHJfQoe2E3UqcqTK/dPmYv/y9dO8AmeWpaAjgN3y7DNAlw1+0pVf8+qs9
	GKSMj6zmVouENEzd8CoNon+hC9iAbVNaGISdm22PJjA==
X-Received: by 2002:a05:6820:1c86:b0:6a1:4e5a:e642 with SMTP id 006d021491bc7-6a14e5ae9b4mr7017877eaf.2.1782743515284;
        Mon, 29 Jun 2026 07:31:55 -0700 (PDT)
X-Received: by 2002:a05:6820:1c86:b0:6a1:4e5a:e642 with SMTP id 006d021491bc7-6a14e5ae9b4mr7017835eaf.2.1782743514691;
        Mon, 29 Jun 2026 07:31:54 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.231.34])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4472f0464a6sm21209882fac.15.2026.06.29.07.31.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:31:53 -0700 (PDT)
Message-ID: <2754f738-04ef-4f54-86bb-6744e768a8ad@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 20:01:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: qcom,pas: add thermal
 mitigation properties
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-1-291a2ff4c634@oss.qualcomm.com>
 <20260610-ocelot-of-stimulating-excellence-bcb0fe@quoll>
 <03d863ee-2caa-41f2-94b5-7332fc930b42@oss.qualcomm.com>
 <d81bc78e-2c1d-45fd-90c9-f7ec462183a0@kernel.org>
 <7f1e46fb-15e3-4638-9930-8abc1dd5a778@oss.qualcomm.com>
 <fcf93e0f-a2f0-4070-86ec-8a34e9344b76@kernel.org>
 <ec65893d-873a-4a62-b0e2-5008b2130545@oss.qualcomm.com>
 <3cbcaf8c-357e-42d2-91c1-9d1a32c55ed0@oss.qualcomm.com>
 <ae43a691-4879-4bfa-8c7c-1be16945480c@oss.qualcomm.com>
 <9a31bb29-75d7-42fa-b8a8-4155cf85cadf@oss.qualcomm.com>
 <c32e263c-ba4e-4899-a935-e129de0f1269@kernel.org>
 <61765401-3397-497d-a0ca-e9bf9d76cc6a@oss.qualcomm.com>
 <5b0f1f39-ddaa-4a2e-ab29-34aacc9ff672@kernel.org>
 <ae0ec05e-607b-4022-a006-2eb1a283144d@oss.qualcomm.com>
 <d9582027-8555-49e2-9a36-c3b952dc61d4@kernel.org>
 <af39bf37-4ab4-44d9-b91b-b8fa1784783a@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <af39bf37-4ab4-44d9-b91b-b8fa1784783a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMCBTYWx0ZWRfX3qtXe0bsjYg3
 ZqsViFFt6HWWEq30GdcJ5jehq1IJ/1K8BTdfXicM07Y8+dOUjEf4cSKuxVCnKZa/iNWTS3D2UN9
 sCYCnAHSN6JebHQr3WgkCwxuyzhWJUc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMCBTYWx0ZWRfXxhqlfdQkmW+N
 eXkKkDGQdfc9Xe3OI55DPPAeIvvN38TTUFgIamVzUMjc3g0lWZ/zbmL8aVirVLIXFkxLzz1DwoI
 BY26uPA3PwYIHqTNEfBMhdAm/FE1n1aiQO+5F/hAsSWNbRWGqhMjlDxrWwM/8mivEFmFbTOWLju
 hHF2hAttqyScvLOK1lR3r/Uda5k84W823f0Z/vR29ckHDJj8dFXpDh2v7Tgp7q6QQ8hZMtijSgw
 pB9+M0BKFlwNo9zQV7BhMIvBFajhgf7PI0UTmbH7nwFeFqf6L8hqPVYeLPPR2FRZ1dRD6pjBLpo
 VGw7uhotiIW7mNg0qn0OTMSyHfGyWyAiJiNiGT2Qhuc2jxiBBivoFMdzMuoKlzMgD6EWx2hNzXz
 sr7gySgAPKe+9WdPjGmGG1CD13fj3jjJGpX36reLh2P1ul+Z20d7v8QfWMIIbxwPQ03UMrZgHpe
 dlIVYFBNtBVRJGjuEiw==
X-Proofpoint-ORIG-GUID: HSDMMcUf2WWwGefhqFLq5j5VYEOg4o0x
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a4281dc cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=JaHktJlP2QtFIg7UHuVw+g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=p2ZdXy1_vrHN-z_H-RIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-GUID: HSDMMcUf2WWwGefhqFLq5j5VYEOg4o0x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115169-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:krzk@kernel.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 4C2876DC32C



On 6/25/2026 1:21 PM, Daniel Lezcano wrote:
> 
> 
> Le 25/06/2026 à 08:48, Krzysztof Kozlowski a écrit :
>> On 24/06/2026 17:56, Daniel Lezcano wrote:
>>> On 6/24/26 12:42, Krzysztof Kozlowski wrote:
>>>
>>> [ ... ]
>>>
>>>> Therefore I still do not see the need of tmd-names. You know the 
>>>> name of
>>>> cooling device, because you have strict one-to-one mapping.
>>>
>>>
>>> There is one remote proc with one or multiple cooling devices attached.
>>>
>>> We describe those in the remoteproc node with the tmd-names.
>>>
>>> Anyway, we should be able to list the tmd names in the driver itself if
>>> we ensure a consistency with the index by defining them in a shared
>>> header eg. include/dt-bindings/firmware/qcom,cdsp.h
>>>
>>> #define HAMOA_TMD_CDSP_SW 0
>>> #define HAMOA_TMD_CDSP_HW 1
>>> #define HAMOA_TMD_CP0UV_RESTRICTION_COLD 2
>>>
>>> In the driver:
>>>
>>> struct tmd_name {
>>>     const char *name;
>>>     int id;
>>>     bool disabled;
>>> };
>>>
>>> static struct tmd_name tmd_names[] = {
>>>     { .name = "cdsp_sw", HAMOA_TMD_CDSP_SW },
>>>     { .name = "cdsp_hw", HAMOA_TMD_CDSP_HW, .disabled = true },
>>>     { .name = "cpuv_restriction_cold", HAMOA_TMD_CP0UV_RESTRICTION_COLD,
>>> .disabled = true },
>>> };
>>>
>>> ...
>>>     for (int i = 0; i < ARRAY_SIZE(tmd_names); i++) {
>>>
>>>         if (tmd_names[i].disabled)
>>>             continue;
>>>         devm_cooling_of_device_register(rprocdev,
>>>             tmd_names[i].name, tmd_names[i].id, ...);
>>>     }
>>>
>>>
>>> In the device tree:
>>>
>>>     cooling-maps = <&rproc HAMOA_TMD_CDSP_SW min max>;
>>>
>>> I think that is somehow what Konrad and Dmitry were suggesting
>>>
>>> Does it sound better ?
>>
>> Yes and I am surprised that it came now. So you had TMD index available
>> thus the ID was defined. If device has unique and fixed ID, you should
>> not have any more properties defining it, because that ID is enough. Any
>> names could be only for users, e.g. label, but that is not the case here.
> Yes indeed, having the constraint of cooling index and tmd(name, id) for 
> the connection between the cooling device and the thermal zone was a bit 
> confusing in our discussion.
> 

Thanks for review, will send new version with this new dt binding approach.

> Thanks for the review
> 


