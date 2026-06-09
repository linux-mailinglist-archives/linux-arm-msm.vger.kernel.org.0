Return-Path: <linux-arm-msm+bounces-112068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yzO7IJLYJ2oG3QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:10:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA6365E215
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:10:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KPcuKoip;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ol1WwDLa;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112068-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112068-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 62F36304C0DA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 08:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41FC93EAC9B;
	Tue,  9 Jun 2026 08:55:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F393D565E
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 08:55:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995354; cv=none; b=MJ4suG9uyiIs6sbP+PYPb3s3xaFXphlsgtkCsZhCzovXx7OouVDw4Yi71bWRloWh6DLsjBIk12JAsR7yB3PDHURu+0YMTuShOcrobEer0YpEtPBvr8dGak0P0NqWrRGhbxTIR6Ljwe/IDQg2M73CLu8bWDDHQEjKiVG7Pw8uMKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995354; c=relaxed/simple;
	bh=Xe1BL6A5lRpPWbazdd4EF6rQ6ZxjXLfPDpAzXm9ZePY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rp24aglV+kCM1DXcHps8mhN46K44tgOCu1G2O8S/8LnHaGIflb2DkVJ5aA7t/2QnN/RFgtrATUc4vlYJ9F3fdpfo5Zzo4QGq6jmbjZng9jqruAFYRjuqWTk2bkOOAgvGKqCgWrngxKzoK2ntVZ9QKFOsH2AGomDQ7TiySBL52Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KPcuKoip; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ol1WwDLa; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rQeA1517718
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 08:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OqhRNzlXQzrgamoipiClCQMj6Wo+WVMbjmsBPJ43o80=; b=KPcuKoipBodtdguf
	CX2hoa08zgX8vWNmwsyejdGx/JV+I2HBFfpOHdqEliTCpKFWVkGHQFMoqWWTc7+Q
	xaKeRKM5jn8K6ddYb5YBioAEUlEA/wlYCfxlKdguWW9OX5sYRVZjtMKL/UQjOSPP
	Mc54ITn9nwu7Q4Ce7GpBolUJEWdQCNUpBewA5Oox/YLL/tZVT0H2OuBoaPB/t8uE
	HewA0F6/ToLs5q4yhNTsRXHF6FuCnrISW5N3+DnrwNSyRpGPW7xmwKxMPv1wwrUW
	R2wusIKtwGDPRUcOKWHyhN5/qRby89Jg1+sg4+ggTfHc58vDtBKZIfQ7LoqqZBuG
	cL0ZTA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epenr89pg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 08:55:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5178ded346eso10401351cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 01:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780995351; x=1781600151; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OqhRNzlXQzrgamoipiClCQMj6Wo+WVMbjmsBPJ43o80=;
        b=Ol1WwDLas9ICws1MmGDrGpHp7WKCF4yUzv/X1gD2vPFj08i6opavJTIPML+HIfHAEd
         cY7DOvxM1fbLUxTLOEL+y87TBvACCBjzftJAdomGPSg3/hFbVIyNfin7GU+Y4Go3VHF5
         78pdLvtERpxfGL6U1Ua3isKY68+npEiQjfZh08NL9KgAvMScfDog63OpmCCVDoujajAb
         9s/OByIwDZO+orE6sToxn8lY2wHotKotIqVsiVsjVSpANH8Ad0E69HLCy8Z/+8OY3GeI
         GEo81+9e6VPT/wRShKMKCvzitgSjZZq+NryX3fGAoCpPzgA4O0WksT93f1B7ZkwUWqem
         Ah2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995351; x=1781600151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OqhRNzlXQzrgamoipiClCQMj6Wo+WVMbjmsBPJ43o80=;
        b=SpN7J4hkCj7qfJJR6E1OSCG7m2JqO7PJ15+ofSzlqztIAwb+hpBW8HHlY6Nl+2NZpE
         N94hZSC/64M3h+VK9UBB63MhJLhjUEZ9nN9iy8i04HHTidYndR8a4dy/x6xnR7qh8I8G
         DmQHCAbTmfnhVcDAVvq6t2YLkuxoc1ggBttyj+WXMWiLtZS37a2N/0cw6X8JPLzWP/CR
         BXuloOrNV6Ev7OnlsQMJErCcLL9rjqYjE5opBwwB7ppYRhsWNKj1HeV/An/99Y/R3apa
         aIrF63kknxwOB+gtF9sNwjJCwnMr60msiCwIyUrbLefIxLTmKkJXAGnnq9Mp3/RTCv6P
         +c9Q==
X-Forwarded-Encrypted: i=1; AFNElJ8beIDQFoAgBzYjB4A9MQVfObm6/rFl6Gw4VcN4vwtyW1M3v5Ijs7f7fXn9xJqJPfH1w7dgMYfMDuhKop+I@vger.kernel.org
X-Gm-Message-State: AOJu0YxV94FMJQ+mRCNnJvmUE9kIrloQNidhGNU4i0viKDe8ICDPKagU
	h/P1ZhLvWFjtkas2AoYYeUzDW2PZKp9r86PJY5GH4cdB1echIXtnU95yQbRFoUshJM7D5iC9xT6
	MDM16gpgStnHBx/jix/KNruQ8fhtqufppmB8dBX9MUkpar+9lAq4bqv/HTi7Jq7cqCJGj
X-Gm-Gg: Acq92OGfuBCBajpNE3dh47sxvH++JJiMW8nQh8S3QGXDKL0pkHBo1E5z/kbpuuegeIk
	G1ou8R9xTZbT8t9YeKuyV45cVERo1a7AUWQi8A2D+LWNEsbFseBU5WhUcPoWPmvYVHwDl0cXZNK
	NdyW4iMXtXVU48BIh+DfMeiP9P2dHcNvZbQMm5C1Np0vcLI3AutPZC5XfpXU1XkfkB6ak0dj04o
	hruw2wCBbKJz5LxaJzGQG++KHIXxWZR4gZ3qdIheXNjp7/iBz9Lp8hhYqdA9OErxs44SECGRyMr
	OSGcJA5pr3jqQAv3E5WkGmwlHRdfcv/Zi0mY4p10N6Hjg4tpW9vxJSo78ndTvEje92thjaMKfdK
	YK5etW6WfVaKyZz0Pu8B5aZ5usSBCB1fVtSeg4O+FhoXEiZ4gi2vvUCSP
X-Received: by 2002:a05:622a:1b1a:b0:517:6b29:348b with SMTP id d75a77b69052e-51795c59f49mr163385751cf.8.1780995351319;
        Tue, 09 Jun 2026 01:55:51 -0700 (PDT)
X-Received: by 2002:a05:622a:1b1a:b0:517:6b29:348b with SMTP id d75a77b69052e-51795c59f49mr163385501cf.8.1780995350725;
        Tue, 09 Jun 2026 01:55:50 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6585154dsm8180974a12.15.2026.06.09.01.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:55:49 -0700 (PDT)
Message-ID: <a6b17b9a-f639-4a7f-adb6-d0c9dbd31e68@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 10:55:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND
 controller
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Richard Weinberger
 <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
 <20260608-qcom-nandc-mdm9607-v1-1-4639a0492274@linaro.org>
 <20260609-quirky-rat-of-criticism-aea1fe@quoll> <87mrx4b164.fsf@bootlin.com>
 <aifKejyF7n6QsI9h@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aifKejyF7n6QsI9h@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3eSxrBhuY3ulhkoG8h_HAIHhx9dI6_7j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4MiBTYWx0ZWRfX7zQ+95qIsWRa
 cGYE15ohTdjg9xwbd0eaa++1FO4tPNJcnJHnxdbQaMqlcKmmHQo0kWC1ADGtJQJzTOK8hJxDRBf
 cLX4T/X3wACojxjdGyQ4UIFbF+zyC78EG37V5FwP+nwqOoOctub2P8U/F5003kfMGbefaJIAqiT
 LOCs0Cb+3kA0lzDeaNYHA4vBrSOGClA5ZdQpLb7Hvbofs+XLSAgJ86zZSm0f2lU8Ot8dfHm2Jsm
 MwbQHUYK/GgAM2F9SqkBUM1MloW6swAqGzpjbiuwdoHYU8dQrKxlLE4E7byCWfi9qrxmNMgYJIs
 VSGBLyFwisUPVFWfLboZSHJAaL3audTrO/jEiSIbaXZY95y8ngQZKPdCDz6K5l+KuQYLYcYz6Mf
 QedOAKwIPXQpzQdjTgpbT18aEvtsFl+OEvhwK1IuXZ6A4H2iLAgrRY7QyePyS+kVTy1xCqlYYy8
 t3lvhHT5ANmi5TxtHPA==
X-Authority-Analysis: v=2.4 cv=NKPlPU6g c=1 sm=1 tr=0 ts=6a27d518 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=dZUDpN5UoYg7q-ifSsMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 3eSxrBhuY3ulhkoG8h_HAIHhx9dI6_7j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090082
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
	TAGGED_FROM(0.00)[bounces-112068-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:miquel.raynal@bootlin.com,m:krzk@kernel.org,m:mani@kernel.org,m:richard@nod.at,m:vigneshr@ti.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-mtd@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8BA6365E215

On 6/9/26 10:10 AM, Stephan Gerhold wrote:
> On Tue, Jun 09, 2026 at 09:52:51AM +0200, Miquel Raynal wrote:
>>>> On MDM9607, there is only a single controllable clock for the NAND
>>>> controller (RPM_SMD_QPIC_CLK). The same situation also applies e.g. for
>>>> qcom,sdx55-nand, but the corresponding device tree (qcom-sdx55.dtsi) works
>>>> around that by assigning a dummy clock (&nand_clk_dummy) to the second
>>>> clock ("aon") that is required by the dt-bindings. This is not really
>>>> useful, so avoid doing that for new platforms by excluding the second "aon"
>>>> clock entry in the dt-bindings.
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> What is the problem in giving twice the same clock? If this is what is
>> done in the hardware routing, I do not see the reason for more
>> complexity in the binding?
>>
> 
> I had that in my first draft for this series, but this would be wrong
> IMO. I suspect there is no QPIC/NAND related "aon" (always-on) clock on
> this platform at all. I'm not sure about MDM9607 in particular (maybe
> someone from Qualcomm can confirm), but a similar platform I was looking
> into at some point actually had *3* separate clocks for QPIC in the
> hardware and none of them were called "aon" ...

gcc_qpic_ahb_clk (50/100/133.(3) MHz sourced from PCNoC_bfdcd_clk_src)
gcc_qpic_clk (likewise, sourced from qpic_clk_src which is sourced
from GPLLs)
gcc_qpic_system_clk (32 KHz)

No clock containing the substring 'aon' in its name on this platform

Konrad

