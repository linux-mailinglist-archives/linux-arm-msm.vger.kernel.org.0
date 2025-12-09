Return-Path: <linux-arm-msm+bounces-84727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C5CCAEF03
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 06:27:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B589303A0A3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 05:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4585B284B25;
	Tue,  9 Dec 2025 05:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hiWMEyZa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bnn91Asm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9584A26561E
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 05:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765258048; cv=none; b=IVi99/96a52PMIXatV/eE2d7RNivtdrhGrixSz52xim6WldlL/vJW9fzwYp32P3X4g0mAYOBfeJ+Tz8cWiQ2BqFHo38T7H+s9bUBqyGi4n/e4qihhc6th4OphSE0CJFhHVxytTwqm4FsZ6q+tT9s1I5OiEeeq0dwBDm/nhQpX2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765258048; c=relaxed/simple;
	bh=DnJomOWsH/A9+29OhJx1O4OlsjuyvkTziAeXXYA7uv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RtYyyY0QYqJRQzDH28vRPUhqgJ4hBU1YlsjAX3gtdtPtASIn9VCepIT8C1ueHmZlwD8ha0B4dUS19HZvhl8KLf8Aw+w9duG6iG7uP1kEfDLfUsMhv4Xmvk+4fO+8BnQpRTS55MNo2cMFkgJh0xhyzoU3Qtvw99dfv+uES7i1LBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hiWMEyZa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bnn91Asm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8NXFun2367098
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 05:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IMCgIJGsE4vObHn0eT5NJVOvY+iZ8qd9njYcH5Sk0q4=; b=hiWMEyZamUrermsn
	ZkvUFMtcYyIz1JiDFfThKTyfU2Zv4qkKfnDLvxk8rS5dKDd7TzbWQ9wMGtTvx47u
	klblJA7Trk1xMirfXyJeIt+FlIrX6vDYDLQI2rUbppiNC7ey35PK6Az2h2/50k1x
	PTL9iAoW7raS/idnJm7x9qlQuDCvbM1/jPW8pgWoWOmMXJWo7SkLX88wM0WSqMkS
	l+zy6txIaxWV25r19n3Ryk7vLlF1Px/IKO4oM60XDLWLy5CYvFQ092K4jheSeT17
	UlYZmwfIyMl3OUkOTihpWK26akyJ30px2Rx/ZM4PBPlIyYGGT+NuIgnihaNJDWDA
	fH2WuA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ax4fqhfp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 05:27:25 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7c240728e2aso9677888b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 21:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765258044; x=1765862844; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IMCgIJGsE4vObHn0eT5NJVOvY+iZ8qd9njYcH5Sk0q4=;
        b=bnn91AsmlKP7hmXhakLN3Cw2PNVHmqbFFmTwCrGBF7tJxF5VKZKIzCbWbyztI20/UT
         9dfmSLOU/JR5XhtNc8r3Cue7MYwHNAEzrzjYgSMCU/BGcviIwWRWuNsaEUSoa/au95vt
         DU9+l1w5701YGhfQgxyxJA063nVpV3RFdGldsvD4JyHdepnL5uEbgdnXLA6DjBlKXYjb
         /Smgzxtb58hbPGDMhf39uyQWk1Tg4Af2GXgm/v6QWZ4PMNwfr76QocsqRVt7bE8pb/wT
         aafD1koZNFRjQTR92tkfPOsuHG8bJyYzNb9YcQFprCXW6b7F80uA/bwg4Soy1FCzCLC8
         FrLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765258044; x=1765862844;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IMCgIJGsE4vObHn0eT5NJVOvY+iZ8qd9njYcH5Sk0q4=;
        b=FbGb/SaxlonuXXYH/nzU26JdjAIBgqSHPgTwWx9gY6tjSsxOEgxsNVxuQ0vHL/Nd9C
         KI0RcFLCRh2cz8RyKOcKRfOCqip5pNyOGlvpsgOmlVOn1NgHHdiOs+yVicsMbZLGj4LH
         uJ1Y1SSbo6QkZFRNOdnLCDVlq/7dyjq4a86EUBQPOIlTMYsHRDRagW2Y45zVl9PxrWZe
         nDM86Fk4JlHb1K3ihzg02U9OgH/6E+D+vfqL7zQBR0BvfJbphfrALplDZFujEwlqrSLc
         vNSAcI9AIbRA0txoIWQfhwcnnAXit5CNDAw1FgureaQCJL7x/6Avdt8WqcZKSRc8qkyF
         X5rw==
X-Forwarded-Encrypted: i=1; AJvYcCUHQCBi58DyW2HCgDcUjtclrr7140P1Fm2eXMz71Blj4xmA1nK7tzXtZCsHp+z9kHlt7+r4IrTpzOL3UhYP@vger.kernel.org
X-Gm-Message-State: AOJu0YxaxB1wDRdiM8MiKjQyL1gTB5AQ8/OfVy8tfx7a4MvBeRfapypB
	1pQDORnxSiQK4LiZ1io4VWABoqqh2XWscsfi83VyRikg2DsFeo3JD+f0557P528SfXumsUzCbLC
	0rXSbk3xtPJAQ9zmYmR1sbhrut2FaIciAxtwL0a77xc3u0ZFIpL0L3PN1IQs3spOiri1i
X-Gm-Gg: ASbGncsYRyrvVcvO111VcpCPkPHxBJgCR6x5s1dGutXKzvxR/X8ha8RgaKV6VxR6ydk
	D0gGMNtTOWJUPZjlB/qIux38dzJT+2qfHSOYmRi3VneWUqxJmxSaVWwsYajxEcUSFf1gP6RSUd9
	JjffaCASDcsOJLZhIkmUAQ5QEvNs2/13l7dMM7Lsnew5Wxq9fCK2z4Z8tJhNjV2GtRqhcD7fYTh
	UJawsLb6Tr6bkdh+nTKtt4nBNfB6V6brZl4s6dh0ObeIIRMpLRpkOmPfWISRyPJS/fFl8zF/Q6C
	AjOl2whELWHtFem4nm4PLtBsEba787tVN+Frq3cb561RT5+TxLsdpk1nvov4hkTktPu9Mzh7+tr
	yICN3VE71bg9Inueqdqg8aon2eFLMCVtc3rvlp0Ffbw==
X-Received: by 2002:a05:6a00:2e14:b0:7e8:4398:b35c with SMTP id d2e1a72fcca58-7e8c54372eamr8721708b3a.47.1765258044198;
        Mon, 08 Dec 2025 21:27:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmSLsEWNV4wfPoZd1g+hDEGVfykeAdoNKus/hSUixAEIUH767tMdjHwQvMb9nzDHCd6MS5mg==
X-Received: by 2002:a05:6a00:2e14:b0:7e8:4398:b35c with SMTP id d2e1a72fcca58-7e8c54372eamr8721679b3a.47.1765258043686;
        Mon, 08 Dec 2025 21:27:23 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2a081587esm14616953b3a.27.2025.12.08.21.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 21:27:23 -0800 (PST)
Message-ID: <dad4957c-ca13-4742-b46d-03f0478911d5@oss.qualcomm.com>
Date: Tue, 9 Dec 2025 10:57:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] PCI: dwc: Make Link Up IRQ logic handle already
 powered on PCIe switches
To: Niklas Cassel <cassel@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>,
        linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20251201063634.4115762-2-cassel@kernel.org>
 <f1059d5d-3fa5-423a-8093-0e99b65d5f4c@oss.qualcomm.com>
 <aTev28wihes6iJqs@dhcp-10-89-81-223>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <aTev28wihes6iJqs@dhcp-10-89-81-223>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDAzOSBTYWx0ZWRfXzL9BUArx9o11
 YbgG43yiprR3R9G2dwZARBfVOIk+b3sPSX7a65VsH6TpVWrO+SyIjwcM64bymuhGrGD4U/OHd9p
 OZuq9vzQ3CTZSfxpRXW08fMLfwhiNtzGFJ1zvzh3y/pvMxvvyjxEm0a5DO6urOZLFNJlFvhyVJf
 zu/WE1FCs0fpFlvftI+35m14CYitF4jmXI0LRxkP32YGjkkRz1Qba0ZTdrQKQhwTAikTtV7L2HK
 wyq3q35xJj11ugyEczQqcNjhLEmykq2LOb8W3n7mNHpO9u8YhNsIBoBQe/CXfn7oHc23sN/+nq6
 Pp3fHCcAacxGrUMgdjsgdFZoj8Z/AvDe+9LB5AZ4d9CL+BALl/ZH2c0tvQ5CwPE+wFWtb2aUTQV
 Khi/xHa2oqQtA+6FecH7xw5RdkGfRg==
X-Proofpoint-ORIG-GUID: h3R8C6WRX14ts22sjto45kNfBosy-mjW
X-Authority-Analysis: v=2.4 cv=TPFIilla c=1 sm=1 tr=0 ts=6937b33d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Vr8HXvedtgjsJtqvvw0A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: h3R8C6WRX14ts22sjto45kNfBosy-mjW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-08_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090039



On 12/9/2025 10:42 AM, Niklas Cassel wrote:
> Hello Krishna,
>
> Currently:
> For controllers with Link Up IRQ support, the pci_host_probe() call (which
> will perform PCI Configuration Space reads) is done without any of the
> delays mandated by the PCIe specification.
>
> This seems quite bad.
>
> A device might not be fully initialized during during the time of these
> PCI Configuration Space reads, but might still return some bogus values
> that are actually different from the Configuration Space reads if done
> after respecting the delays mandated by the PCIe specification.
>
> I think the options are:
> 1) Keep the pci_host_probe() call in dw_pcie_host_init() for controllers
>     with Link Up IRQ support, but make sure that we respect the delays also
>     in this case.
> or
> 2) Remove the pci_host_probe() call from dw_pcie_host_init(), and make sure
>     that pci_host_probe() is done by the first Link Up IRQ
>     (i.e. what this patch does).
>
>
> One big thing with using the Link Up IRQ is to not do any delay during PCIe
> controller driver's probe(), which reduces startup time, exactly as your
> commit message in commit 36971d6c5a9a ("PCI: qcom: Don't wait for link if
> we can detect Link Up") explains.
> Therefore, I don't think that 1) is a good solution, so that leaves us with
> 2).
>
>
> If pwrctrl drivers are created as part of the pci_host_probe() call,
> I think that perhaps an alternative would be to create an explict
> pwrctrl_init() function, and let the PCI controller drivers that actually
> use pwrctrl call that from their probe().
> (And just remove the same from pci_host_probe() ?)
>
> In fact, looking at your suggested patches (that hasn't landed yet):
> [PATCH 3/5] PCI/pwrctrl: Add APIs for explicitly creating and destroying pwrctrl devices
> [PATCH 5/5] PCI/pwrctrl: Switch to the new pwrctrl APIs
>
> https://lore.kernel.org/linux-pci/20251124-pci-pwrctrl-rework-v1-5-78a72627683d@oss.qualcomm.com/
> https://lore.kernel.org/linux-pci/20251124-pci-pwrctrl-rework-v1-3-78a72627683d@oss.qualcomm.com/
>
> Seem to do exactly that:
> Call pci_pwrctrl_create_devices() explicitly from the PCIe controller drivers
> directly, and removes the pci_pwrctrl_create_device() call from pci_host_probe().
>
> So I don't really understand your concern with this series, at least not if
> it goes on top of your series:
> https://lore.kernel.org/linux-pci/20251124-pci-pwrctrl-rework-v1-0-78a72627683d@oss.qualcomm.com/
Hi Niklas,

If this series goes on top of the our series i.e pwrctrl rework series, 
I don't have any concerns.
My only concern is link up IRQ never fires if this patch goes before series.

- Krishna Chaitanya.
>
>
> Kind regards,
> Niklas


