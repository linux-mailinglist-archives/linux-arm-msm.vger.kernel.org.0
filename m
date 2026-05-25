Return-Path: <linux-arm-msm+bounces-109623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CI3yGPggFGpjKAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 12:14:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A9C5C9216
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 12:14:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8F813045B00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B7C346A18;
	Mon, 25 May 2026 10:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LU5i+Xov";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hc8fIviN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF0133F5AE
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 10:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779703872; cv=none; b=FoLMa0FR0GH3XRNTB84U5/YMErSt8qKaGvNtvMMAkRtghY9xuEQui47j0sZph86OBi+NstpHXM5+fJS7091+1TAtawGW5NPZ3LjrHKI7JBLpwfgomESXlVUpTy22th7h1XVvUyoBadKDWbU7IW6PSk63hD1e3kv5gT/xNMIeJME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779703872; c=relaxed/simple;
	bh=P4dVGRQKkBEtwZP6u8xE1RJh7CgRpjAHqyFfY2ChCs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pl02c7KCj1Jvt4vm4g8pEX2zc/nPqkMOBAfkRIYSjjvtMVtKur8bFEVSA2ZY6E3cdnWd19Y5UsqMIipavMVqFnE98gCmLyeDrnjb9pV+vSb1Q4JGIN8WeVcrMZuaxFOjTB6s6echIUC3+kOiXD7esgindbU9bx0YT+M778bWiYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LU5i+Xov; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hc8fIviN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P6VjbJ1202108
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 10:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hnosm6bAr5zKw9j0Wc5bgbJCD/lHL0CU/unVt2stucs=; b=LU5i+XovFgsqSmH3
	1KUOlfdqXm1KDBoDg7ibn+JiZGZnI65NG+JSmGb5YCVGFNPyIYKuHdJ2xrzp3zBC
	n+h55i13YmqZ+rPvfEeJTk24KShDJlH2bLMRl5G9VWBD27klD0BhFOF+aGp5GcP0
	oerNi2XPKV8TjN7U+3eVnzxr2YiapXa3O8QyM7XLuMbYphv3mxcmYYjYBm0q33u7
	FAB5MNzr0FbBZIElOygNT86OwofJaahD22FXOPcZMjCLUox3Q/4rdLxMxoEmzSil
	xO4eA3YabKBkJSeyvK4T/pwLYL9+7vAy3gicPkrrXH4vIPM6JOzydgeK6UFDSfeP
	xYUJ6w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4asx7yx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 10:11:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-366ded5ab5fso18620733a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 03:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779703868; x=1780308668; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hnosm6bAr5zKw9j0Wc5bgbJCD/lHL0CU/unVt2stucs=;
        b=Hc8fIviN8TjMC8JTU+ZpFrbR7XkNXw/RevcFdTAmXwIPRGO83zSa5AgMUo7BaE9tbG
         nstbqYrNQN1C69xvJC+KuICrSVIW8qfNOTU4/0oTM5jWwowoW7uM0j2AdK4OitIZQVya
         1VwQDgVFCE42SuidVZJWqKhzJmf/a+QFvrvXmsa/R+SoKo00cWCT62+GeuGpS1i2TZsz
         39eaQCsenEmVIKjkJZaH88sXR0nkZOhZDaOcisnYH7mErr0IUAEYs8WQDvkAjHg8haQJ
         1PigpF3NO4rB4pQ5k4/NxQmLrdHD5uDu/tWLnR0ygHS8n3ngUi4hbfyEEaGdrLtf3ho+
         vrdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779703868; x=1780308668;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hnosm6bAr5zKw9j0Wc5bgbJCD/lHL0CU/unVt2stucs=;
        b=VJlxLzHUxn5KNPD+gFPtPpYoVgNsLXHBBBv+0QTsBw5LX7UZNqCmNFDn99eCU7aR+E
         LUXjbn5bz6/6vZK/qGdEgAz1Fc/GfFh2y2vIbpmZ+qsEd1q4z3mln0/7dxzLkkxfmID6
         U0gkTnbQc34FbDvqV+rlfiMKL5/wPaysJhC0l6jXuc70pU1XObf14WMbK2M7HBsKgXFD
         49dNp+V0Q74iXxyi7efndvsc+IUJMc3PXTfg0CP9in8WhQ4bwK5INxas8AxOQCyXw4wE
         kXaKK4/bCl/0PimtqoA3Kod+iotIaJCyP2xNf3zRk4pyxmsxD4FUnp7Zkg5wmq8jn4DS
         PZMg==
X-Gm-Message-State: AOJu0Ywq5Lm64XbwhuZHsI6yGj6XEoscfllSXGH0gBLSVBRMLHtpk6nE
	RPzmXGHyXM/J5bbe9yFs5/6IZ25fMZlb7aZpMSZULtVcjCpf39Q3nCB+1+ugW+w+LzUfe1tvdxl
	r32StjRnRDzt/miNGrOl97X8Z1xsoFKAE2O+uCAGKwaFUE2+wGJ7NxpmQ+/itm0ESSz5z
X-Gm-Gg: Acq92OGaMTX4zmrDC1GNjif7pC6c8ocZ/nhmkKM2dwquH8bvVLsgiXLTf73hWzFNhOj
	V2bfflgJBj7ihNNr++8pUhn/J+wxeT2ud9vqnjApuDtVpbxkBWYy4KTCafzzkyMikw047Df74Nu
	zElxKnY07/cPBqMXV0LfuA3KSP3OdXo58LXp+uOYX20XqLUVXmopHHqfLFtE42L/bn20FczO1cj
	g2OVBg2mK5eO8pdlW6+WuxgVChNPW5Hl/JdBLPToY+VXZ8Vlf2+b1sZtGGZhzT3rcTF0iHEM2/F
	z3MYxpYIqegSagFkZC2dZwEVHEpXNvHtE6bLiHfHErBqggDvpajCvjyHFzweVaiT0I0cvNKOzIh
	boYrjhFs4+TTwt72OY9CKPRe84nSqiEeaz30Lg7d2WtBn37s9
X-Received: by 2002:a17:90b:4986:b0:36a:f623:83a4 with SMTP id 98e67ed59e1d1-36af6238686mr538517a91.26.1779703868234;
        Mon, 25 May 2026 03:11:08 -0700 (PDT)
X-Received: by 2002:a17:90b:4986:b0:36a:f623:83a4 with SMTP id 98e67ed59e1d1-36af6238686mr538480a91.26.1779703867725;
        Mon, 25 May 2026 03:11:07 -0700 (PDT)
Received: from [10.218.46.60] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72c913a1sm8638003a91.15.2026.05.25.03.11.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 03:11:07 -0700 (PDT)
Message-ID: <c60f75b1-c2d3-49cb-b8f1-549391c815ca@oss.qualcomm.com>
Date: Mon, 25 May 2026 15:41:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: Enable cpufreq cooling
 devices
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260415-cpufreq_kaanapali-v1-1-1fa94105d5c2@oss.qualcomm.com>
 <020442d5-5697-476b-a96a-6e96ce054363@oss.qualcomm.com>
 <95a01fa6-52d6-4e44-bc8b-69743b2b48fa@oss.qualcomm.com>
Content-Language: en-US
From: "Dipa Ramesh Mantre (Temp)" <dipa.mantre@oss.qualcomm.com>
In-Reply-To: <95a01fa6-52d6-4e44-bc8b-69743b2b48fa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwMyBTYWx0ZWRfXyk5BhqAeplki
 /RIHc6kMBNTOVtCeX6ysC6Uw5ZacC+soMKDTblRBKvct4gMgsRbjqfwPn/JWRRmNKjmfR5tyhxz
 OzY8Z+7l5nCDk0K5kjdTT8yezZFpu7D1zEA9JgBJqPndqhX/mVCoKVRWWi3ygqUgE8pwWkKT61c
 TFaiq6tCp1H5MiHZSkow9DBOfjD0vR7qjvmU+JNVP624BtsjNJUn+xUeEJvDQ77RSsF94uBY6/g
 yA1dixeV41LrvnBQFZjNe9oNYC/+aFKDBd6PbYw4HMOvIIeodv8+QwegXoT8cZYeuFQiQyZvgxL
 nXKvvFLtVl5jp+2Ib1oMYPKOh83H/hZJgZIvc+LUn9Mnt9tz5Gq4Ky/zTxDVFeMKgis/PY67BoK
 pFhSi4im/z+jemWTb+q8gsGCVcIYARCvbX9mFeloLMhGAeUXbbQ6bBJlh5O+gIOu6RA39R818mT
 CAJ2orx682IRD+WXaVA==
X-Proofpoint-ORIG-GUID: p9D7xw9JheGmar1MI9k__NgR6roeF36h
X-Proofpoint-GUID: p9D7xw9JheGmar1MI9k__NgR6roeF36h
X-Authority-Analysis: v=2.4 cv=c6ebhx9l c=1 sm=1 tr=0 ts=6a14203d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=G4GDIulgaXVMZWVEnn0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1011 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250103
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109623-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[dipa.mantre@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D4A9C5C9216
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/16/2026 10:44 AM, Gaurav Kohli wrote:
> 
> 
> On 4/15/2026 4:31 PM, Konrad Dybcio wrote:
>> On 4/15/26 12:57 PM, Dipa Mantre via B4 Relay wrote:
>>> From: Dipa Mantre <dipa.mantre@oss.qualcomm.com>
>>>
>>> Add cooling-cells property to the CPU nodes to support cpufreq
>>> cooling devices.
>>>
>>> Signed-off-by: Dipa Mantre <dipa.mantre@oss.qualcomm.com>
>>> ---
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Konrad
>>
> 
> thanks for this change:
> Reviewed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

Thanks for review, gentle reminder to pick this patch.

-- 
Thanks & Regards
Dipa Mantre


