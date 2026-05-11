Return-Path: <linux-arm-msm+bounces-106889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oG7DCi6sAWqdhwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 12:15:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B7450BB62
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 12:15:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2431F301E20F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 10:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D6B3BB9E1;
	Mon, 11 May 2026 10:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ftmuEuhb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cRJ4tnUG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68F838C41B
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 10:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778494221; cv=none; b=ku7lPXe4i7H7jYoQFLtDKedBKB4vaXKe7+93vvIbp5hISe/C1ISTEQotDMIrvGPgwVQcyyluI7hSBgQGlzGkJWT5Nh5Xh9FnShtaxbZ6gTsV7Jr4eg1mNg8dkCCSXNjadorD6vBo9Jo+YoXV6zqMBdPFbJPE9stVphnHfymVgQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778494221; c=relaxed/simple;
	bh=X9sORV/wiiGYQHAzTx21UitHqOYw3XUCsUNB4SyMAlI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PAEp2h/xEBh7RKS6zeXnEbZaleIq6LL26vuH6oCpnxnNL3MIvNkPa0Qbs3OD2gY+ozufoi9J2Y8IZB5grZ/hshay9YIp/nm1zKc9iM+GZCDes1Zj7lzyPJmBCLXwxLAwLobTRcAC8eFjSl7LhZRhAoLTosciO0V/UdUZlXogdTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ftmuEuhb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cRJ4tnUG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BA537s2039464
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 10:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zmvXZ5t54tW0Dx9vyHqx34Lxx4w7VRwNX+TNDvhocGQ=; b=ftmuEuhbOoUoXqtQ
	6jYtklWke3lpIsk/h2tu+2yTOl5LVm5MdjpfmNjoIU0865dgsYtDcvju4/WOk3wX
	qoex1B9/RE251StLkhmk4hUxfh2JJ6B6CbWz2FkkY2lyt5XGpj4mlFJvMR/HjeU0
	s9Q3GxU3jPSlZH2ICxYP/fx0LibuYYbtDkUre+sPAicMK1nkRXVQkYFtwMvvDEKE
	LxcDnFpgaKHPyC+xUZedYnrXmf03tsW6WoM8NH5/fmSSysKzBcZCzFZPjoyF8nNH
	Rw9UTFBRR1KdGEfcYwte40CAXMSWZmD0WLVWaUmI+hEI4SCXuUwjTJ5AfCG1K0IK
	u8k9iA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3d22r0jv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 10:10:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8279604464so1563750a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 03:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778494218; x=1779099018; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zmvXZ5t54tW0Dx9vyHqx34Lxx4w7VRwNX+TNDvhocGQ=;
        b=cRJ4tnUGmFmF0ph5NEFvvMNKt27HcI10vdUkX8ojwiy3+NkIB1O5hsVk+jXjEl0+na
         2RPkYP2fFPBTNFee9nXG/cjWxs44xuiC84YN3a0njBs5t2WuWeq19Kj3J+f+qqS9dspr
         RlZrvht3WKziaX1jT4YMBmxOgeXOJ1B3DP82sVTkhbfJV4MOYXbldgjFJTr3rp0AsOMW
         Lz6CX/t+xqvlzjIS2VjjxWDv4u8tWoqK+uTYDffuZoTmbE8a+T4LkZkwkK+iaCf2s1Ee
         HOmitjMKVShvNly8+wcyceCvmOlHTe/b28tYfnOqrmxNJ0Wq00WXx4H4ixXutCc226kM
         F5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778494218; x=1779099018;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmvXZ5t54tW0Dx9vyHqx34Lxx4w7VRwNX+TNDvhocGQ=;
        b=sSeqPIGazdR+DSYwaeCmm0KJqoQyFyJoeMAEJ3eqPVfZnSTHfq1ux6COrAb48RXbyu
         ZpzO6aqf1dE0MFbl+TwCNczHvtOhXSLy3Di95L2u5Fq4jWrJEQL6XNxV6aDsjqdc8l0p
         jYGuU3CKxML4rg+oAA0rusAjuWBDH1zmAToytlDsjWt6YX66cTKlB52gbAkkgYMsPm/Z
         XMJQW4mbWo/X98d4C1o+5yZMDyx2ML+al1EJImSBRj2DpgsWP+y/a9fkiswAxbbTNLIC
         JbOwzWrS9zFxSyvw3G+weNb5VFJfTqcqEK0YzIpk9gAYkZ9DxW33UMT18W24iRi2cQ65
         69BQ==
X-Forwarded-Encrypted: i=1; AFNElJ/uZ8PHE1bfEF7bnFZ6qTVv978JFOru+vNLdteBX5kOikFmRCPt/9AZcIGHTsYS+lfeP2G78rc5lxlfe1cr@vger.kernel.org
X-Gm-Message-State: AOJu0YyeMN/OzvdscGzPbbvA7ELjmXJ4xDko5pdRQn7/OMhYd0vPFvlo
	sEQjhzy4Yf7GhAYumixefrgROmuXQmxssEMfEwp4YxI5jd3FTDy3dprj4CmLq2dXlC3dLGz9PQB
	68lbHwqwhACSAVmmmgYjRpO3gnSb8+BOlelyK2+P4/MI7hzVuUHJ/twkn2oz10w/+KUXg
X-Gm-Gg: Acq92OFHogPQ2khtkR6toOGvEWaij1bWEOtd+rgtOZ8poLl32//zRigKmq0jMFSSMf7
	lu8JeZbfVbSTR7FxwSMFuoWIEhgJuf9i7+l87FuwiIwPoyVvOBsFmllMTn6iN7wKnDQpXgarjAR
	g0/kNU7yFKqWrjNQPcRVjsSlRkdBzWyeE9W7jJ9yvxChcUu22DfQfGp7Vu0LhPIY8XMousWo/nJ
	7xZGSX6PGg8IXFOU3EkBEBHWOaCFqkuW6WEKGEdUkNEEumQEjHrMIJ9+aMKjMDS9NPZoc2oCdWU
	wDgwqXAisRLD+1yJVQpmDyvwtS9d+HcOndrGW1E9sZ08bENucgZniPbf0RJgkgOGG2j9uBuJxcf
	kas/TEjAoinVjvo54+djr8R014JnImTLx17P4eEBQdRD1Z6/U5wfvNzCgtHWK+uXA6eFKfOBrPM
	cRuSIIYn6neg==
X-Received: by 2002:a05:6a00:6d5b:b0:83b:a723:d705 with SMTP id d2e1a72fcca58-83ba723e347mr13846787b3a.16.1778494218392;
        Mon, 11 May 2026 03:10:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:6d5b:b0:83b:a723:d705 with SMTP id d2e1a72fcca58-83ba723e347mr13846747b3a.16.1778494217917;
        Mon, 11 May 2026 03:10:17 -0700 (PDT)
Received: from [10.133.33.31] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839682a103esm25192471b3a.51.2026.05.11.03.10.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 03:10:17 -0700 (PDT)
Message-ID: <684c63eb-26ed-4cf3-99c9-bd09ae05b5cc@oss.qualcomm.com>
Date: Mon, 11 May 2026 18:10:07 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Enable CTCU and ETR devices for multiple QCOM
 platforms
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
 <545b4ebb-2c7e-480d-80bb-5e08dd3c52a7@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <545b4ebb-2c7e-480d-80bb-5e08dd3c52a7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EaT4hvmC c=1 sm=1 tr=0 ts=6a01ab0b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=nTQ8HVyESOUA6E9D-IoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: b3Mx77UEClOUpl_5wJrU3tZRuibZd_6f
X-Proofpoint-ORIG-GUID: b3Mx77UEClOUpl_5wJrU3tZRuibZd_6f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDExMCBTYWx0ZWRfX7vZyPI9mGeMS
 tuCKQHKMhcqfHkk9Nv+chJjKmUxqNIT7CXEKiVrjxI3+54SJxTeJeD7OC9Bj0zsE1itFUht0jkU
 M0xEwGsWPjytk+Jq76+vMJQ3z5FGMSpZBAN5tyFwAjdIejZj2j9WMkEy43LxgjvbnO0bng7jJ8m
 zvypLf7IDRxl9O6t729h61oVzYrutVbJxfbmRbtTem9TV+fkR6g0GLMqaxSPS51Gc8nYx+ooWz6
 5oUCYPLur6+wGtcx1OH+ZoSOZHGVEZuJScs1pzSSg++O4DWeiq9xvuVtyoUCp8THU7S/XkkJyUm
 PrbeDAO+LCBCjDTD+42y4vDm5zPjPjGyqvpvL1oGvGewFC0fs6TYJdVtMlE/GOOg0HgCceWxh19
 iqL73YFyUZwJA2L1ujDpbiGnPN1XH6HRBY9DHqgJeCvKraLo36L3K1RRaKGvcg4kVoM0ET1qlBM
 O1jg4IT5/uuQ+9AydIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110110
X-Rspamd-Queue-Id: 83B7450BB62
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106889-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


Hi Bjorn/Konrad

On 2/27/2026 6:10 PM, Suzuki K Poulose wrote:
> Hello,
> 
> 
> On 04/02/2026 02:22, Jie Gan wrote:
>> The DT‑binding patch adds platform‑specific compatibles for the
>> CTCU device, and the following Qualcomm platforms are included:
>> Kaanapali
>> Pakala(sm8750)
>> Hamoa(x1e80100)
>> Glymur
> 
> Given this is predominantly DTS changes, and there is very low chances
> of a conflict with the binding yaml change, I would recommend this to go
> via soc or the qcom platform tree.
> 
> For the series:
> 
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 


Gentle reminder as Suzuki's proposal.

Thanks,
Jie

> 
>>
>> Since the base Coresight DT patches for the Kaanapali and Glymur
>> platforms have not yet been applied, I created DT patches only
>> for the Pakala and Hamoa platforms. I will submit the Kaanapali
>> and Glymur patches once their corresponding base Coresight DT patches
>> are merged.
>>
>> The Hamoa‑related patches were posted in a separate email, and I
>> have included them in the current patch series.
>>
>> Link to the previous Hamoa patch series:
>> https://lore.kernel.org/all/20251106-enable-etr-and-ctcu-for-hamoa- 
>> v2-0-cdb3a18753aa@oss.qualcomm.com/
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>> Changes in v3:
>> - change back to the numeric compatible from hamoa to x1e80100.
>> - Link to v2: https://lore.kernel.org/r/20260203-enable-ctcu-and-etr- 
>> v2-0-aacc7bd7eccb@oss.qualcomm.com
>>
>> Changes in v2:
>> - change back to the numeric compatible from pakala to sm8750.
>> - Link to v1: https://lore.kernel.org/r/20260203-enable-ctcu-and-etr- 
>> v1-0-a5371a2ec2b8@oss.qualcomm.com
>>
>> ---
>> Jie Gan (3):
>>        dt-binding: document QCOM platforms for CTCU device
>>        arm64: dts: qcom: hamoa: enable ETR and CTCU devices
>>        arm64: dts: qcom: sm8750: enable ETR and CTCU devices
>>
>>   .../bindings/arm/qcom,coresight-ctcu.yaml          |   4 +
>>   arch/arm64/boot/dts/qcom/hamoa.dtsi                | 160 +++++++++++ 
>> +++++++-
>>   arch/arm64/boot/dts/qcom/sm8750.dtsi               | 177 +++++++++++ 
>> ++++++++++
>>   3 files changed, 340 insertions(+), 1 deletion(-)
>> ---
>> base-commit: 193579fe01389bc21aff0051d13f24e8ea95b47d
>> change-id: 20260203-enable-ctcu-and-etr-31f9e9d1088d
>>
>> Best regards,
> 


