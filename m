Return-Path: <linux-arm-msm+bounces-117125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xiItILSOTGq7mAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 07:29:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A73571775E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 07:29:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dEfxmN9C;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ERXaHJXA;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117125-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117125-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3BEF23002914
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 05:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31EBA384CE6;
	Tue,  7 Jul 2026 05:29:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24513845B7
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 05:29:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783402159; cv=none; b=eZ1LNDbR0HnKRZqjHi8nU3KdZHPunjAne2MTZvIbS/IXtqg2nh24CWerO8DfelcXnm1pQXCW901vkLOtYjVW654WAu5Uj5AESa59Nx4THaKo9txtejMTe+XdBXMlyU4gmalyRmGDYw0gR517Xp8HDwQBNKSmJG/gY7ED10wjig0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783402159; c=relaxed/simple;
	bh=r2Qoj38C8xdqySKKZYjVn472V29s5lUT57W4KgmR0Yk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I6x5Xl4QeskekbuvVZExtM51t4cmbwhrUbRX48nv/NOLipL4RkMNvgX3arMMFf7DGR1T3dtjY2omhKTo+8v+iCbFRtmAqj+rdl1QaJm/yr6MYKFDYPgKKz6TCIZaT+qciboaLxEpOKMJ1GUaQJ9uqZNVfysMc1k7E5o/rewSjUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dEfxmN9C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ERXaHJXA; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748up22688424
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 05:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qSXgz44N/WMvteS7u/WYSdLO9UdWbYIO4z2GI2oG19Y=; b=dEfxmN9Cbmv54USE
	ywSrvt9W0ReGbJ+ymdVKuLj2r0IdTFaIP3KedI6YAPPSfGu+RDw1Jki2Rsw3TsCf
	q/XQTkDuEJsznxGBuvrr+NG/enZb9g4RVRChSK8friFDC1Vr7VuebTWfCP07wE9e
	oK6Qe0yg0duLP8jkZwa/58XpmBlCzcpsL1dSn4++muNjFjVqrCsqOsKuWj0AkPxy
	swd6EBpFlTAZHzfmVQ0P578GcDjNv0MVw0sp7UQtGkOG2BgqtUXMlDok2i4swHLx
	+4hr0m34sEUxy5lilKZVv+rHuqmcoNgZM7q+nOXMu289cfyDCwephq2IDNUpg1CH
	eemdyw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gv9xh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 05:29:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cac01e89e3so6601685ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 22:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783402156; x=1784006956; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qSXgz44N/WMvteS7u/WYSdLO9UdWbYIO4z2GI2oG19Y=;
        b=ERXaHJXA+9lOO9k7v0KvhiX0Ymdmvy5Nazq1/chvXkE61gh01/2JnLhuqzX8jfZpxy
         PXLUCV1kjPaP7Yz+Ncea7Xn9z+91y4J4lqTbx6t2NFAFUFApHk58o37CYLojzROO9/C8
         OW3jWLqIR45jcftbSDqO1BRuDlyrBFmUaMOdo+IsZcTvQfhjnkqYDhCOg8hyK3Zgu25/
         O8ZrLMmD+YQzulOlwamoFa5jr16Yt/+VUlkY52XgJI9lvj078EThYYaQrev8iXd0beWR
         6FzOog0Y3AGDPXWS8OrsM+kAN4im+ye0fmxYjDbyjJuOJ1CLCcJ3JdpbvZOC5SNG0pbr
         0X5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783402156; x=1784006956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qSXgz44N/WMvteS7u/WYSdLO9UdWbYIO4z2GI2oG19Y=;
        b=Z/Gvy04Onx7RQuPongytHop919a0nZR97D0bXIhG1A6cEvcfosu755yMdW0kvS+yZu
         vd+DWpREkY4nLKzisWahsemwEJt/PqC9ZSsIQXaiSJW409jju7fiVSluqwxfOqkaeUP5
         JD6xj9p4lAe0qNS3WeZEAfIXWZkumOJtBdusVZ/T9UIGTIAlwHWXNa719Zgv3UsI0xTI
         RRyjutGC8UYiJxbtX8dGCHBL7E2Hscxo0e+1f7u5v12Nz/sU13pgrVj3Ce66pU2rd0wI
         KrjmC7TFLlk8IRiwqeAzBqOaJhAg7SQAcmUquhYDxxYWu8fu2T91Y0ELg1uH9LU8yrvj
         6Gxw==
X-Gm-Message-State: AOJu0YyawCmm6MB4qRop2PfMRV7oJwRhAwxVSqR0n06VK3oXydZXW93P
	JZXwol2sxY2INz9lbeCFbBItz51yeoNIhymG+fpTtWJmkwqTI8XMN1+ZOx6UHIXFvYf/5JikxWf
	JcEranCKx5OpWGsU8Ugso8OibhhfHstHEpMg+p3oUwCDlK4VZjCSeVT7D5Hjg6H0OY/YO
X-Gm-Gg: AfdE7cl5qe9AyGp0yVL6NbSESr/sHDRCrG2WPOIdWOjHFeRc+zJi3XtFmNN1z8/cTln
	xKJPU4mTVrRzSXolgH/pHOtQ6HT5dtN9w3Yie970Plt42EZ0vonIeAViTijtHOTlWeh5Kgpvj26
	4GNefCFs2I1WR/irKay2e3WXhCVuks1EbtmQPMuVrBq17KDTytJCoiBxJRDdkDlkg10DAhDmJB/
	fMui9lxotlkmIoSDjvPcPB2GfZwca3+wI74TNWL6XAIVI8j2JXh+WiYVmnkIgh9gme0zhC++LBu
	HAsoho2oAAFM6WgDVAHITTpomZ8i/YbtnrfYOfJHspmilidwyOOeLQVPmRamQQk8oeiR6Myp0Is
	mAbRAa+yFPB4pPh7maTI8m13/1HU/FFB3T9a//hvFKc4SBMzdKX2L7ouembguTq7iYrn1N+DjX0
	uGM9iH
X-Received: by 2002:a17:903:2a90:b0:2ca:12aa:a390 with SMTP id d9443c01a7336-2ccca5a26a9mr13454415ad.0.1783402156374;
        Mon, 06 Jul 2026 22:29:16 -0700 (PDT)
X-Received: by 2002:a17:903:2a90:b0:2ca:12aa:a390 with SMTP id d9443c01a7336-2ccca5a26a9mr13454215ad.0.1783402155879;
        Mon, 06 Jul 2026 22:29:15 -0700 (PDT)
Received: from ?IPV6:2405:201:c409:b03f:6d0b:bb83:7a67:4093? ([2405:201:c409:b03f:6d0b:bb83:7a67:4093])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bc2asm5077475ad.69.2026.07.06.22.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 22:29:15 -0700 (PDT)
Message-ID: <5e941fd8-e40e-454e-bc54-2c9a2bce0d19@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:59:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] dt-bindings: PCI: qcom: Document the Shikra PCIe
 Controller
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
 <20260701-shikra-upstream-v1-2-e1a721eb8943@oss.qualcomm.com>
 <dd9e68f3-c33d-47d1-871f-f085550b88b1@kernel.org>
Content-Language: en-US
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
In-Reply-To: <dd9e68f3-c33d-47d1-871f-f085550b88b1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: a78pynGLURoWdWP8uMDBSo0VwD0emAnD
X-Proofpoint-ORIG-GUID: a78pynGLURoWdWP8uMDBSo0VwD0emAnD
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4c8ead cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=m11qq-JmO6Yq1UjM5qYA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA0OSBTYWx0ZWRfX9iaBbqiJMRXi
 CkhD3X6jaTcf2pfxNSHMDaCIoV1MGIsKMTRCOD6C/vKxh72WujxpbgLgbe3TFjPiMAO4TILg5FD
 5t35VtQetLZrRO1KhJ8GEL27EI1rRU2DWWpWRwZTF9uOZXJSJthQp9U06sswl78JNwoZx/HFw14
 sbBhUcKkNWo7GV3F+3TkVJJr6w+jmBUQ210mTCpyY3vjbeSczo7fxp9wNxS1xRIppphdH6zqzeu
 zlwaMMzGrkJLzchrqHsk1Yn7clyjzVZrvbEwxf1SEi1r8IpdkVU5jzqFC8UKKU0Tt96FZ3RFVrl
 yMYES522JTmayhm9TukWd0GblF52m1bq4wDwgCR9SA2RfImwFNwcd30j+syKLKJeCj142Cx54yk
 xcUOECyG3FmXo9q9rHUNJw4BlKTozy0SBxHAq45LKC0gZupgr+FeS0MzobOCSOC2czysh89cBRN
 LULi2h+ksOR9uCBKkAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA0OSBTYWx0ZWRfXxcuMTz9tEvhr
 O68ZE/e7amELK88/xQVe2P/lD2MTVgytoNyiKRRIuSdc/v9FxJGSjm4BGfX7PHeBt2z8+a1OctG
 ZZCi0yiqJfxjRIQJn9iAMZBHv+KXJiQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070049
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117125-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,devicetree.org:url,vger.kernel.org:from_smtp,linaro.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:andersson@kernel.org,m:krishna.chundru@oss.qualcomm.com,m:brgl@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A73571775E


On 7/1/2026 11:56 AM, Krzysztof Kozlowski wrote:
> On 30/06/2026 21:02, Sushrut Shree Trivedi wrote:
>> Add a dedicated schema for the PCIe controller found on the Shikra
>> platform.
>>
>> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/pci/qcom,shikra-pcie.yaml  | 211 +++++++++++++++++++++
>>   1 file changed, 211 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pci/qcom,shikra-pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,shikra-pcie.yaml
>> new file mode 100644
>> index 000000000000..f9d1dba9dd2e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pci/qcom,shikra-pcie.yaml
>> @@ -0,0 +1,211 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pci/qcom,shikra-pcie.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Shikra PCI Express Root Complex
>> +
>> +maintainers:
>> +  - Bjorn Andersson <andersson@kernel.org>
>> +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> +
>> +description:
>> +  Qualcomm Shikra SoC (and compatible) PCIe root complex controller is based on
>> +  the Synopsys DesignWare PCIe IP.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,shikra-pcie
>> +
>> +  reg:
>> +    minItems: 5
>> +    maxItems: 6
> Same comments as other recent Qualcomm bindings. Don't invent stuff,
> take what was reviewed from the list so we won't have to repeat.
>
> ...
ACK'd. Will use latest binding patches as reference in v2.
>
>
>> +          power-domains = <&gcc GCC_PCIE_GDSC>;
>> +
>> +          max-link-speed = <2>;
>> +
>> +          operating-points-v2 = <&pcie_opp_table>;
>> +
>> +          status = "disabled";
> Drop, you never tested the binding in such case.
ACK'd.
>
>> +
>> +          pcie_opp_table: opp-table {
>> +                  compatible = "operating-points-v2";
> Broken indent.
ACK'd.
>
>> +
>> +                  /* GEN 1 x1 */
>> +                  opp-2500000 {
>> +                          opp-hz = /bits/ 64 <2500000>;
>> +                          required-opps = <&rpmpd_opp_nom>;
>> +                          opp-peak-kBps = <250000 1>;
>> +                          opp-level = <1>;
>> +                  };
>> +
>> +                  /* GEN 2 x1 */
>> +                  opp-5000000 {
>> +                          opp-hz = /bits/ 64 <5000000>;
>> +                          required-opps = <&rpmpd_opp_nom>;
>> +                          opp-peak-kBps = <500000 1>;
>> +                          opp-level = <2>;
>> +                  };
>> +          };
>> +        };
>> +    };
>>
>
> Best regards,
> Krzysztof
Sushrut

