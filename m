Return-Path: <linux-arm-msm+bounces-80848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA23C43408
	for <lists+linux-arm-msm@lfdr.de>; Sat, 08 Nov 2025 20:44:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 808704E192D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Nov 2025 19:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DE7026D4CD;
	Sat,  8 Nov 2025 19:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vat9R0Ui";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HvdBgMV0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3538F2BD00C
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Nov 2025 19:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762631054; cv=none; b=SYibryflzsvAzmkU22B+6EFfDYXXZtAMPsznjhipKzz5+OJiV2FYDCIYCuDNLvyX0l6J9er0tP6HuLMkLuV+dDoog1oT5Eket1p9HDZmrlAroES10Q/0iXb6mDlG0EUK0bChYio/NGnZJoyiretOATdd89ldAItOCmSb9wUMhhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762631054; c=relaxed/simple;
	bh=VTSz20rTG1aH0wrKhZOgUArplz/ieHDHEPZlov5X+mE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tcqXSPQClzGF4PnXPGuxKfBfJmqb1U3uKVmmnEBtE4cdHX6d20z/3d8YPyoeEuL9zNOGk3rqmL65U6nv6eztQOkXMwE4glon+W+aqzGmdgk16jLVezCFNGgQXiYtHoEfGH5F+q4lt6NzD0+zKCVU4wvSY8mwfGESB1kz3wV6oqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vat9R0Ui; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HvdBgMV0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A8J0TDJ2394724
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Nov 2025 19:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FT3kHDy8XQ+OKhr6kp2cr3BCjcsGe48E1o0I9V0WZEI=; b=Vat9R0Uihty/VB7y
	zZIthDCAXe3ANBxS5fD1ny/GOcwWhwUNtAneEM2rFpObJzBRS/nTQsr4Y6mri8Ag
	6TkZZlD050Nlx15OfyElSOX/cCgDB5HGEK+zE294YQu64nlCcouFVmWJlo9PHpgh
	JjWBlghdA7hZJz9YSny9U8rSLUc9N1o0O9+Cxak1JvNCgXB7QivevV+nQ9nEAudg
	BcwJbkslZSn2+vZQgZjUuha8J3aEMgQzzK3B3T05yfdBKa9fB0bifeLaUnAM6laI
	DQhp8djXKpqbv1/6nDcsq/fV9ljqb3Vuwp+S0YtzmF6dwcljB6/tTEfWK/kYDagS
	wqBbhQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9y1h12uf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Nov 2025 19:44:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edb35b1147so464881cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Nov 2025 11:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762631047; x=1763235847; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FT3kHDy8XQ+OKhr6kp2cr3BCjcsGe48E1o0I9V0WZEI=;
        b=HvdBgMV09N4TZefxz8knlZ7Ziu0PY04Ff9MYCRVc6Ku0UZvihcxwoLr3ac0BnLzVwd
         EQVZoaY4j/IYzm9N7lH8WDz1H+yDJrF5tIGjQ2+qZQ88FzxVvXkXsGOh52liRsJM/Kxg
         PcOzfLKVbbcgpKUZNX2XEm3d+M75GtOn5eTLrFqC04s5SKqRFAJa99JESsC3RFYkMp9+
         ANUWCbMbH5XlBgNtFOAY6Wbj2dng3dgCKP8H7bZZKS/n5rUuPC7o9ONcrliiXhM1Ay2e
         2MmibjGy1neYnbP9iq3xomD0SOp8c23a9A/j5z/0VMxob6atoG6dPW2JkmhafF2gdA5f
         KApg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762631047; x=1763235847;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FT3kHDy8XQ+OKhr6kp2cr3BCjcsGe48E1o0I9V0WZEI=;
        b=jqiUxWZmHMGJmn7Ey+dkksPifPGH3+OlrTZs9TbHSq3WUNTycvtlFgvkdHHKqKtrm+
         jfTu8zGNF0EXdHAGKhqiAuVq+SbCNv1wlwI/1aLOoBeYlVuPiJbrdqu68XJneq8sBaSm
         UXPAyzDKdPy99me6k6tn5STBVs9uENmjyXif5+XKC0KON5senMB6sa3i1RhgoqyX7ZG3
         yC2FunLMQhxYZAu8o92Scoa08JY0msGXS6uU6Q9W30Yn2j0w35QMaAQnj8js6AjQbMtT
         d+GfZSYGIHjQlu586oNVO5Z9UegYS7kLoo9VHwGxZobZiCO3M5gA8WZ9Kp8SFXEtKuNf
         rC8g==
X-Gm-Message-State: AOJu0Yz2QOA0Rwl/eUmoSNK+7TpMkQEcC+OD6vGIquCXKEvupEK+X0/h
	wVX3S+Ihe0eOhUVv0L9E4Z5PSXnzkYgOcYMR5cDem1UXqV56ZAt+PZh6+lLRSbDCICUQdJGEtac
	WmAPXr9n/JdhIsBRtmrGTPEBNKpcF9t7aU9C7M1MAyyQacPUPVOFbGrNAc4ukVOfbWt4OdFLW8j
	XZ
X-Gm-Gg: ASbGncsseZr6kUlvWTAZ8gXAsJMcvHuH7odoiD1D/4C2w0jlbFPJD15FskEli+lYaGp
	UqoHe3yLSxCYzN2yAM2KPyCPN+TiJJfUYMmLOPmSPH2F32y3BWCHZ0tAlZWpBca/S9BbGGGFI8k
	/P1T64Ni//IrahNYEicGGFWj6NiRYTSMBaSMyKaMFFzEJ9fZFgUgM2ly0qgKGwkDjRU9XFpudpQ
	Yu2cvvW4oXKDu+Kzf701DYlDWn7X8vT1FekTu6CcQUEZxkRfLP1sjKAt3LHyR0LxgWaqKUkCubF
	HUZAVQU9XpPcxxD3H9VlLrtPRN1IGxCOxH2baUolei02RV+fNqi9sgUhG5XYZ1mmvDyrgdSsQkM
	dtjT946CHgwa9gcg4USjeg3WZ6gdTO4vpYa1PBIECdO9NuRGlo9pjZ/Per0a8m8vGNPB7uDxAw6
	wQ6MphPp2oA7XV
X-Received: by 2002:a05:622a:d2:b0:4ed:6803:6189 with SMTP id d75a77b69052e-4eda4f90165mr44035471cf.53.1762631046655;
        Sat, 08 Nov 2025 11:44:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1izejizTOw2Xlf+6jFJ+KW1P8MwXGl0upmgZWePVoKX+KLFw1M9Kenun4O5QTw5VbgBHA8w==
X-Received: by 2002:a05:622a:d2:b0:4ed:6803:6189 with SMTP id d75a77b69052e-4eda4f90165mr44035291cf.53.1762631046170;
        Sat, 08 Nov 2025 11:44:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a5f0dd77dsm22231291fa.34.2025.11.08.11.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 11:44:05 -0800 (PST)
Date: Sat, 8 Nov 2025 21:44:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: philmb3487 <philmb3487@proton.me>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: SM8635 Porting Effort - PCI-E Card Doesn't Show Up
Message-ID: <wtyikmhzyizezs45yqubflxivxj2iyk6dkutn643v7iokvqfcy@fxmysaq26gg5>
References: <xAsYX3yZX3laVVaqB8tdxUoTWM3jFlYudJ7j62r-6redf_OJgS_eY2mEypJ0Ma8B26RKeCqQU2G7pYTKapYx0M0rPAEvdpA2oyOs4XA8tcE=@proton.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <xAsYX3yZX3laVVaqB8tdxUoTWM3jFlYudJ7j62r-6redf_OJgS_eY2mEypJ0Ma8B26RKeCqQU2G7pYTKapYx0M0rPAEvdpA2oyOs4XA8tcE=@proton.me>
X-Proofpoint-ORIG-GUID: hQzuIJCzYeKDPGQ31fgiLgSn0DtLqaIL
X-Proofpoint-GUID: hQzuIJCzYeKDPGQ31fgiLgSn0DtLqaIL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDE2MSBTYWx0ZWRfX1Zr+xfYSei4O
 tU/oyVnUxEC2w/fvxoOGl5Q9NnAmXWcoW6GzbTESk/rVh0fyhNLAn6exB8jyLYhrDgJ3hTGimiV
 Q4qJLi/LMJLfHOBh+Tbp8nGWF5n9mZNcwFSgRcsXc/PygENU6jHym7QpPahEOBf8Blvfj73+kRb
 oyesNYa+vbigKcqLRMova91yZKv32RhXptXgfClhWGbtLQwbTurudmlt5K9+j5Xh60AXXNdr+pE
 zaARLYXMZrv5CnQ1cT+TrqoBui3KDpNHOj+u1yjabKshDd+IT9n3pHPj2kL7KlHJrZILXCHCuF8
 beQh/d/oOmCaOQnC8W3NFT/31uF6dkecVZ1Iy5UoPpCbowRsVfIacM4Fe4hpVco4c9zJMYPsMVe
 FTi4/Ea5aWyAnom2KBf7RD2rDIb2RA==
X-Authority-Analysis: v=2.4 cv=Xuj3+FF9 c=1 sm=1 tr=0 ts=690f9d88 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pvdlRqWQAAAA:8 a=p0WdMEafAAAA:8 a=OuZLqq7tAAAA:8 a=wUmQnC0ta2Xkn2KzdlYA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=tRr4bHXEJ20fZlr3Elhh:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=poXaRoVlC6wW9_mwW8W4:22
 a=pHzHmUro8NiASowvMSCR:22 a=n87TN5wuljxrRezIQYnT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511080161

On Wed, Nov 05, 2025 at 11:24:05PM +0000, philmb3487 wrote:
> Good day everyone,
> 
> I have been for the past couple of months trying to bring up Linux on the SM8635, with mixed results. It is gueling work, very complex.
> This is the first time I use a mailing list, please don't yell at me too badly if I did something wrong.
> 
> I have a wiki that explains those results and what I have done, it will be easier than typing everything here.
> 
> http://muyuwiki.ca
> 
> The reason I am writing today, besides presenting my project (and also Alexandr Zubtsov <internal.hellhound@mainlining.org> is helping with this), is that I can't get anything related to the wifi card working.
> 
> The wifi card is something like WCN7850 (although the DTS specifies a WCN6750 for the bluetooth chip, I'm not sure which one it is in reality), it sits on the PCI-Express bus, but unfortunately there is a complex sequence to bring up the device on that pci-express bus.
> I've tried so many things, poking the GPIO, using the power sequencer driver (pwrseq-qcom-wcn) and the driver for pci sequencing (pci-pwrctrl-pwrseq) which aparently calls back into wcn sequencer. But nothing wants to work :-(. I'm pulling my hair out.
> Take a look at my device tree, could you tell me what's wrong? I know there's a million things that are wrong, but let's focus on the pcie node.

We don't know your platform (nor GPIOs, etc). However, let's separate
two topics: is it a PCIe not working or a chip that you have is not
working?

I'd try the following items (asuming that you have either a vendor DT
from downstream kernel or schematics):

- Identify whether it is an M.2 card or a soldered-in chip. M.2 cards
  usually don't require all of the supplies and pins in order to bring
  it up (describing it in DT is a separate topic though).
- Identify power supplies to your WiFi/BT chip / card. Identify WLAN_ON,
  BT_ON and SW_CTRL GPIOs (SW_CTRL is optional, I don't remember if
  WCN7850 has it).
- If you have SW_CTRL, it is the first thing to check: when all powers
  are applied and either of WL_EN / BT_EN pins are up, SW_CTRL will also
  get up.
- Check that BT part is working. You might get some errors (especiallly
  if the compatible is incorrect), but it should be able to read some
  bits and pieces from the chip (here I mostly mean chip ID and similar
  data).
- Then you can take a look at PCIe. It is a high-speed interface, so
  it's more error-prone. You need to make sure that the PHY is correctly
  programmed, that all extra clocks are not gated, etc.

> 
> https://gitlab.com/philmb3487/muyu6.17-dt#
> 
> Thanks-Philippe
> 

-- 
With best wishes
Dmitry

