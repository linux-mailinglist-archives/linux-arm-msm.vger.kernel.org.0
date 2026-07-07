Return-Path: <linux-arm-msm+bounces-117130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qRqFIoqTTGrpmQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 07:50:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EB442717990
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 07:50:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="pIBWH6C/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Zfcg6zWU;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117130-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117130-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3064C303AF1D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 05:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 082D4386576;
	Tue,  7 Jul 2026 05:41:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9F3386455
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 05:41:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783402881; cv=none; b=jefjxUJhvAZfE78fvmzYed+xoHj7o/Vt5si4ya2gI1xCKcUVZfx5jVBu2H/+P/E0NZDH8FsI8aVILF9AtV1u9Rz40Gsrc2hiBa3Kwk9h0vvN49lICWZ8MSQfB3k0AIhxQBkdR6GqLYwErI3bPRNsbC4InyUNGxbKURyJdxHldec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783402881; c=relaxed/simple;
	bh=lflEKyZ2GNpJuinbyFUPuuftqGQc8rX0sKQ4/Oimemk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oK96bPCfF+yqfeisSp8tTlVM7oSnGjMR5rsZCFnqjLNd7RELneEXaIwmvACi7HfVL85IO7JfTTyLPnhag6c3lfqCCpA8hUOUX06wXBXfZy2MRMxbWLFr8rbGYhvA9MA1PVOmzyfTL3Kh42YL5xjzGWAGuDcG9l8I49b9pvf77dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pIBWH6C/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zfcg6zWU; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66749JZs2658352
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 05:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lflEKyZ2GNpJuinbyFUPuuftqGQc8rX0sKQ4/Oimemk=; b=pIBWH6C/GRvvXGyK
	UUKYecCk/BmHWnvjJUWbpCrXeEV6AzYwfHLiD/JB5aCTOi99/Eyg818IG6T3R2FP
	jph2mKiIANbeN/NHviifXypy/T3ol9IJCF/k0UQezDxP8McA5FHoA8+sHRnMXBSZ
	DSQSPVzaLXvJG3VvKLHXaN7DaXUpyvC5o5dH8tcyZY1lMdCExYakJCs/knZd1TTn
	4ezS6YhRl1KMmmkwPbEEWbkj/HQVuJTvFH/XFOJZceOPxAo3lxZX2y3a0SogvRme
	OfpN+ylzzHLEYnj+m+vauhahORUeja6sJGN0XG8bX9g+RQAHCH5s6hL3VH6zRWSo
	aDuq5Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r48qm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 05:41:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-380ddac2b02so5814726a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 22:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783402879; x=1784007679; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lflEKyZ2GNpJuinbyFUPuuftqGQc8rX0sKQ4/Oimemk=;
        b=Zfcg6zWUKRzoQlefCZvmJ/aGKiYNse1E+mPF8aM+zEPioOBh4AmHAQ/x85LbYlX8F8
         mA4EuExwm50BLcmR0f5VPAYskRtPuF/aQqrDkb9Gr06vfMcUJUSE0EVLy5X9GMkSGxWD
         6N8Wyb3xQoYprdFy3f2wr5CwiktQI6G3AR1Z3UybRCBdj9A1ceggzy1swGh4E+WeqBJt
         Sd+IrRXr36gQpZmYn7mJi7y37EhYycRG9GSvaa2rOHRdSmgTS5d/AfRtgT5ehg6qC/f5
         XST2ZFyJCZCOWPrqtKANxTpdhDikOD6rkt9k/tSudk7WA9eLZk5oU/YCkmFlHvq9U6fz
         vOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783402879; x=1784007679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lflEKyZ2GNpJuinbyFUPuuftqGQc8rX0sKQ4/Oimemk=;
        b=dM5QZGSzJ0qBRl9Y5xjrhmdND6btdu7zd2o+0fVPplz3suEX6JQbAxHSqbXQfsHhdw
         /cpZtZTWbyHU7sDLggL3SJ8xwVFxbk0/FqRyNCIXfDelqkxLwUx38/DmqX0aIuNMxXtB
         G1fGiqFcnNITzobD13E9DmfAvFSVBdmT7Qcc+rOuqrGyjJoqWsSoddOikdkCl9kqRHGA
         dx9oUeUoV2oda9qO6GnaNy+mB9pnPuMe84j76IkpuGEmbN6E6DPW4sBtJBMN9LW0COqi
         qLiqoYuvYWqsqSOfvNZjR3sQWg84r9auGtsEGGBsV+FmMFKxafagnCOSbWk1zGAgDHlf
         21PA==
X-Forwarded-Encrypted: i=1; AHgh+Rr7xCrarHhfEb7JJ3Cbwq/3nCySsMAY1P6EadHKLb6ZpYko2RSnuuzNiLRryZQwrylIy8KIDO2go4wCjCQ8@vger.kernel.org
X-Gm-Message-State: AOJu0YzBBBlPTutTB2vy77VNfiU3fxsJMrR4ywmCLsnQGlg5kSEKvI8Q
	DoIXeZbT5sK4w2i9ocYLiIij7XpbBdQiXPmKhLkm26kX/JKS5iH/ZoWqhbUf9cGHhMm3bfVZyx2
	Lan1RB64CgRI7FAavmnxzsBqvsAMPGijSkhSZjf4wiZxoM2fxJvAOP8SKl/C6ijIAukCt
X-Gm-Gg: AfdE7ckxp9Ww2oRJRfFnKc6MRC2Rf/SgBUxYGgdhTFNdj8ud537Dm7sD2JL5ahLZ3Wj
	9ifLOq9gwh5JqrpA1Pnrd0BpohpGiCY/jw23l+fkcJ1RPzgxRlOm7MU08tLY1/v7mpr/mH9JbVt
	7bWvTFnv2BcJlQWAK2AW/Xhon5jRLNwnUVYJYvjwYJP8pGkZrSxlrYT5e3NzmUWZ83fj4UBIV+f
	W2M7G/1S6AkyIobm95tc56pKYZLKA+86XOvw26yBskfCMt9T5ulYD5GT7987zHhuJfSdAGn6Hdw
	pU4gg4qURVU3t4VIgz2J37A4/3RRPTLdy1tqFq+kx+XjUEvNi0f9aH/JLZWMZEyUvPrr91oYtvs
	vtJ5ZLnJXOtiwDTEo50SkH9lwhxfC5T4hDM1dCkakWeqtupG6UT0fcmqMKDbZOLcxGCoc4vvWyb
	sAhWVM
X-Received: by 2002:a17:90b:53c3:b0:37f:ce2e:32ea with SMTP id 98e67ed59e1d1-3875826180emr3950195a91.19.1783402878813;
        Mon, 06 Jul 2026 22:41:18 -0700 (PDT)
X-Received: by 2002:a17:90b:53c3:b0:37f:ce2e:32ea with SMTP id 98e67ed59e1d1-3875826180emr3950171a91.19.1783402878394;
        Mon, 06 Jul 2026 22:41:18 -0700 (PDT)
Received: from ?IPV6:2405:201:c409:b03f:6d0b:bb83:7a67:4093? ([2405:201:c409:b03f:6d0b:bb83:7a67:4093])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d100b5c9sm426934a91.3.2026.07.06.22.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 22:41:17 -0700 (PDT)
Message-ID: <1602bd87-ecc3-4051-b833-5aac43c2762d@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 11:11:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] arm64: dts: qcom: shikra-evk: Add TC9563 PCIe switch
 node for PCIe
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
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
        Konrad Dybcio
 <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260630193059.GA225112@bhelgaas>
Content-Language: en-US
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
In-Reply-To: <20260630193059.GA225112@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA1MSBTYWx0ZWRfX1XyFKbVQdljb
 40N45jIW+uDPGysGjL6hjwhntEPN+I3nv005qaGcFzZzXVue9y5NJGHadF9BJWHo7MWlMseQRBC
 5DahBYUuCAcrd4R1RD3yhj1wXrtVcidLrNxh53wGHtXX1wGR2TlvVIePxRF89DtABT1RMF9FGHS
 0VQbFuqnOSdA6oNly/pIWT46o9J750bc9Ut7lAQJPQsCqD04SDY0lbidwsPJUDVTk19XV08+M0W
 jQS0BM0/qf7NyddMAYPtGos7MneMib/b5bNo1zaGAfuXtcnvlVU9lwUzR9xGuMtSyNHcwx8b6dk
 xzotzoy3TQfvOpspBUzMPK7Ujyh/ch/ILHImfSDN5BW8vQxtm/VDEr7tRFXTk6hv/EymmhPgsBb
 HJmGlZgwbraFHPmtZ2PNsoLeP/u5FGixreJxt/LiRlXEOC26pREJfZCp6KUP7egb+teL0Tob1d4
 vddnYruvA/KnW9qn/eA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA1MSBTYWx0ZWRfX40DLgfocpDAM
 TSYGPxPSfAQhF4PHOKZQVnk6s2vtiHh1LaGXklkcw2Vl+CyGsiUJ9KTZtFBCNcKHoFKzwFmH5Cu
 jDqLvkAAr8BdSuwHYkAYq838KK+4jHE=
X-Proofpoint-GUID: JdkLZj5m6owVbPXIjkNg4_i7-BQyEAyy
X-Proofpoint-ORIG-GUID: JdkLZj5m6owVbPXIjkNg4_i7-BQyEAyy
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4c917f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=S2spThItiBpve86ZF9EA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070051
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117130-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:helgaas@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:andersson@kernel.org,m:krishna.chundru@oss.qualcomm.com,m:brgl@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: EB442717990


On 7/1/2026 1:00 AM, Bjorn Helgaas wrote:
> On Wed, Jul 01, 2026 at 12:32:50AM +0530, Sushrut Shree Trivedi wrote:
>> Add a node for the TC9563 PCIe switch connected to PCIe. The switch
>> has three downstream ports.Two embedded Ethernet devices are present
>> on one of the downstream ports. All the ports present in the
>> node represent the downstream ports and embedded endpoints.
>>
>> Power to the TC9563 is supplied through two LDO regulators, which
>> are on by default and are added as fixed regulators. TC9563 can be
>> configured through I2C.
> s/ports.Two/ports. Two/
>
> Possibly subject doesn't need two uses of "PCIe".

ACK'd.

Sushrut


