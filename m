Return-Path: <linux-arm-msm+bounces-91402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EHhOvcBgGmb1QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 02:46:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE62C7CA7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 02:46:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D72EF30056FA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 01:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CFE31D5CEA;
	Mon,  2 Feb 2026 01:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iCCQL30Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G1RIERSn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8771B78F3
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 01:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769996784; cv=none; b=Xf6+lnAdhs7tUVHh061G7QSXvIS+d9QRFrIetbhQ/zyljfkdZJTYOLHBbDUzSY4rsQhEr2m+7XMDXStpbfFvWu3k7/v/ODWIO68tzOfmYgWIWx0jVeWTcDjCWBPWjCH75fOz14Y4Rd4jJMrqmC4xnBWT7VPycNlVUFRh/B2OW5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769996784; c=relaxed/simple;
	bh=h+Z5ILtQ33Yo4XMv4+QlPyF4x3r6Q4jQ3Y9Xz/slIPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ajSTyPNhuX6ONmh6VgnhlD7dVrgWdHEhbhiOtBB4SUaMB5HqmvHUtI6RhyQu9Y0kQ05+p70uNqnch3VeaYfeGUCDsj+TfZsYZskljCw13SNZ1TaPse+X0T4lbdtGv7bdAJfzGqVHZEtWSiphmIsvmPgfv+fkpSJathxR2KSeslU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iCCQL30Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G1RIERSn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611LpTZt488620
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 01:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hoK7bDv8RJ4pkEfwcugroG347SfbfafnyDg1ei0aOuE=; b=iCCQL30YeG/lEHa/
	YS4Ro4bBXLm4uxBtM8fduCpx75Qu5Qsl2HxMxXA4CLITemmspRPe9aAMa+fpBtZK
	CkpAh9LbJdEyYvDHzsA6gef+GJCLkNzklt87vvuMOtKRDRwSJ08gy28PRqyuH+er
	OqQjQuTtXo7+2h3300rNTLU4eDVT3QPHMVOgLSb6kxbali2ktOijY4wL2ge2J9Mb
	a+bAsObySzQiIvXXflg4NgU5PS/CrORs/laaCM1YjGBf9ElKXwSA7awsBYYHx3k1
	LwK2FGGPOIho/v355y1ZSzympxMc2YbxndJnEOoTTpb/sVPHHtpkWkRq2DLm9KIp
	DJ3PKw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1b17ug7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 01:46:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0a8c465c1so31286255ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 17:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769996781; x=1770601581; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hoK7bDv8RJ4pkEfwcugroG347SfbfafnyDg1ei0aOuE=;
        b=G1RIERSnSRFdXi0/134EKEs3Ce2+IWC/FGxg0wc0EgvuDJYRwjl/tXilAv1vn9PfJe
         yESeoaDx8FVAn+VZkFFYhzp860Whyas0W400GPao6w1A2MSri9A1MI2Cc+5pVYfet1Zl
         ZEISwN2+h6OISqMdF16ePlZbE2hi3MU9o1PUGAO2tfdxm9jCruj/OgXuBj5MXlwVA23e
         WC/ow2IitrOItqg4OFzQ6a6rME+AHFNKm6g3gbYS6ihuI8tA2IDP+iBdp4WyIp74rKP+
         ozuyeCRRUL91+DH/+t4o+ac+UTi4kBdZtKZAt46PyKzjLo8v5Na1fI0PRjX7AyRRGSjJ
         SfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769996781; x=1770601581;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hoK7bDv8RJ4pkEfwcugroG347SfbfafnyDg1ei0aOuE=;
        b=XzoIkZWn3mtQlxgV46xyXBIaBkIJucFhANT03A/owZhs9MPEE+Jaf1WkC2bX95vzqR
         /yXaIuVXNsDTjK2QlNvf6Y+Ejey9nwxx87FZNN/zejQUxDtctZdEL2w0iSgxbkKAuf8Z
         NS/VbBAtqCzxUwjOTmxDJMX9QAvB+k/NfDAmmX3JwkX+PGDkCkhLyyFTXy037lSqK8tZ
         6sUEY49F1DyS43S3MkBLDxPUx5+BTBvYPd47uqRczy/z2Sg+4+V8KuAiUulodNiJBDPx
         x1H7xZZYK6L8U5AvGMDgoi195KnES1i4ZfPhWfcT1U8O+bv8UUGVmJrSXu5fghp2UVlc
         BfDg==
X-Gm-Message-State: AOJu0YzoZez9D5ssANjR55Bd9NJ2zbx/q3HZF43n2UBkVjAfeACuv4wd
	KmbjJ40Yj+WcZuB73qxA8E7o+J123m+BP2/MURI+DKAE6N34ufyG0BlZFzed0Nh3bmTj+vYJcuN
	V3t1AYIT4Io6EOa849XVQNvOA77eSjASdzyT1NNJs6XlJk1oLSwWYGObp1SETimuYCGxCPHmZTl
	HA
X-Gm-Gg: AZuq6aKHOsa86brsaNfiZlaSeBrZ5BhnDUF96FXru8DlON0SYDNzR3qTXW77HSUw756
	S9kvSHlaARFRiyQvrHJQwu6w1HcxjhaYC8L7XUF4HvgWqCXTAb9QHK9OSI1j67NweTEy6zccT3t
	4BLmWOySB3HGI2csNjlPbl6LlhEoUVDYt91OTyYFOnu9Yr+R6fucQCg0ABmcpHxA1ee2tBE7CWW
	N9fwI/SvdasUApEi1qxfq3YL82teV+jCSR9VsfkwZt6oPUSU9IROK/97YJuOwa+n+Q4ecYhPljd
	E0HVBMsIfuHWj86M7a6iE9Orjltr6RB+Gu2vMjwh0sRiFCh0A9aYcRbLtRjOBFi7VPMuPC45DAW
	l2n6iaXiXfnEKhBFmlQ9qWqbpMgTFI+PmY72+GAa7HCXbXZ4SxWNruVI0C7qRzuCQONulhlTPEs
	k=
X-Received: by 2002:a17:902:db02:b0:2a7:77cd:2fef with SMTP id d9443c01a7336-2a8d9950241mr78343915ad.19.1769996780920;
        Sun, 01 Feb 2026 17:46:20 -0800 (PST)
X-Received: by 2002:a17:902:db02:b0:2a7:77cd:2fef with SMTP id d9443c01a7336-2a8d9950241mr78343805ad.19.1769996780431;
        Sun, 01 Feb 2026 17:46:20 -0800 (PST)
Received: from [10.133.33.156] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b3faff5sm125730035ad.4.2026.02.01.17.46.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Feb 2026 17:46:20 -0800 (PST)
Message-ID: <9fa9a90e-7989-49f9-ae99-3a3a0dbcb616@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 09:46:14 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Add remoteproc in EL2 device
 trees
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com
References: <20260130073113.3091884-1-xin.liu@oss.qualcomm.com>
 <68702c64-7ee9-4571-9fce-0b2d23b3c03d@oss.qualcomm.com>
From: Xin Liu <xin.liu@oss.qualcomm.com>
In-Reply-To: <68702c64-7ee9-4571-9fce-0b2d23b3c03d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LcAxKzfi c=1 sm=1 tr=0 ts=698001ee cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=CK8mY8_xxP8lOHZxmWcA:9
 a=QEXdDO2ut3YA:10 a=eSe6kog-UzkA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: odtH5CbJ9gmOgFIsEmKZSfwYlEtGSCOv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDAxMiBTYWx0ZWRfX65SKcwcS5RB2
 yLWfiE7EUvnyOdv85x+5HsX++p3BSsSxPsQb8WUMVUVaWgbAwfaShvemJ476NstwopPdZL5eiu3
 pQdR+AQFagAlvAB4WWynLAYlGlsfMURQGiCOcogpfM57p+SMs8/He0dV+Zz8GJhXKmL1txKza4+
 V3P4MVpxFed8Vmli6p+Bwrs9i6JXZYu3+Y4umyrJYXHdmMe5Ek9cfDgWHPJ3Ai+K/TUpk2fHrqF
 fZIJbbdLxJMzC1uIQ186At9emMT+HD7D+mRL5f//Js2v+cjctxr/AfpMY5yY1/TVqgzECO98FXp
 pPnpDG3hSx2Dgi5vzvK7M5+QUxtHU0mXlUTiBPeJC4OewfW3gRrAS2UoRxKNFIpE1txiE0TW1Tp
 8YfrQKYYcYdSofUxGyQicJA9Jeq8x6l/4XTpMQsdxOaCAFcsoM3DcKw3GJ8dRgSyOdJSum8M8pt
 T7/3doKvd8iJ5t62yNg==
X-Proofpoint-GUID: odtH5CbJ9gmOgFIsEmKZSfwYlEtGSCOv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-01_08,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020012
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:url,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91402-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[xin.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8AE62C7CA7
X-Rspamd-Action: no action


On 1/30/2026 5:24 PM, Konrad Dybcio wrote:
> On 1/30/26 8:31 AM, Xin Liu wrote:
>> All the existing variants Talos boards are using Gunyah hypervisor
>> which means that, so far, Linux-based OS could only boot in EL1 on
>> those devices.  However, it is possible for us to boot Linux at EL2
>> on these devices [1].
>>
>> When running under Gunyah, the remote processor firmware IOMMU streams
>> are controlled by Gunyah. However, without Gunyah, the IOMMU is managed
>> by the consumer of this DeviceTree. Therefore, describe the firmware
>> streams for each remote processor.
>>
>> Add remoteproc to the EL2 device trees to generate the corresponding
>> -el2.dtb files.
>>
>> [1]
>> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
>>
>> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/x1-el2.dtso | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1-el2.dtso b/arch/arm64/boot/dts/qcom/x1-el2.dtso
>> index 175679be01eb..8279854fd73c 100644
>> --- a/arch/arm64/boot/dts/qcom/x1-el2.dtso
>> +++ b/arch/arm64/boot/dts/qcom/x1-el2.dtso
>> @@ -52,6 +52,14 @@ &pcie_smmu {
>>   	status = "okay";
>>   };
>>   
>> +&remoteproc_adsp {
>> +	iommus = <&apps_smmu 0x1000 0x0>;
> The mask should be 0x80 according to docs (although the resulting SID
> is the same)

Thank you for your reminder, will update later.


XIN

>> +};
>> +
>> +&remoteproc_cdsp {
>> +	iommus = <&apps_smmu 0x0c00 0x0>;
> This looks in line with docs
>
> Konrad

