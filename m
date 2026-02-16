Return-Path: <linux-arm-msm+bounces-92936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SdTNEacHk2m/1AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 13:03:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B3E14332B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 13:03:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A3563011045
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C0B30BF75;
	Mon, 16 Feb 2026 12:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/7fmraQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YehLpqOd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F34830BF5C
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 12:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771243426; cv=none; b=ovSMs122KcROZ8BnMXZ7vIVN2tfEeVk6oN84x3KGBuUUbKRlhQUt9bDJcMFgM5YEzPPU6BiwkmFR6KSTEfgrpy3nX/ZWhpqLpO4e6aV+M+xdR6phmPwhBHLwefrSeV6YdleUo74t9MXuHC/+fpSY1F6r9OVqLCi7VQB6EW8nKKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771243426; c=relaxed/simple;
	bh=OMt9qYi0dDWawXC4CgSrmYFOFq3hpaBjenuDcSPujmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gMbY9sazPhLux2Tx2pD3FEZGO6bROCgGeGBdvIeevYIMYCDGRLrMuyXkJ/rd98yC/PEm6YWLGtOYhDA/gQqAeeiz7OL9oZhbuJCt1KSyvEaI/ERBzwN3LOVohMCwJmLYVVzcT0WNrTekVnUFoxrfmc4LDzyMn8xIl+KWrYHVB9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/7fmraQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YehLpqOd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G9aPen1869034
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 12:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	msQflfcnwvzaxO2WF5SV3QodDRrU+YL5i1PglUfJitw=; b=T/7fmraQJiRG7F+F
	+pVwhusOZ67qwDa19AeKwJuR1qPUKjv2wFNc12EkDuaeZcBYY5AI+gIXbXlwdTAF
	fLFOzVzPAsNwOxIeoxnuIiqARt+/eqaHRZveAolSyqW6ENmbCu3Kgc6MQvX5I6AZ
	YDcRhYYB0wUY+CAcojwpt3Rw9dJRYRmdTH4fnEZ5rF78BMurzpqYm0OvZCwaTF4X
	sqJwScUqg1tPTfw03XpKOuRH80fkJ/6EwyrrLj4ZrE+IVOw6mpRvUeSoB5IB5W78
	PnI1er2DFLDC3cwaVZt2HqSk06m1fOsM/L/aZHW4/rxYi0st6w6GI/YGP/vDEZ0N
	wtjh6Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cb6bujpud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 12:03:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-506afabb8d3so227783101cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 04:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771243424; x=1771848224; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=msQflfcnwvzaxO2WF5SV3QodDRrU+YL5i1PglUfJitw=;
        b=YehLpqOdNlB5YlpYXI3F71yHT160aBIHl0w2Iqwu5CInExnG4MTnkL1AFa6E2G1vqS
         lgp1peMOQOo7e+9xtaO5z/1XebTNzbtCgmRszMB6yTg5VhvB4xEGpq9QKoO+tBdC89RC
         Vdw6S+BUoR+jiDy7yMxZ+yHhf/lvEtBGsIjbTL3HWOSfIuDl8F2Lx+B5mPGsbxJjBgVT
         dIj+K/ljElRiZ+phiB4vFMGMthzM7FnHtcMCfwjwrCjHzkodqMYkgLFLL3X77+w6za4A
         7zpgMmGryFkOdEF/2hL3zvSJiIwvqHNd3TyeM1vhrAFgLvV25B2vsFh28oSDvFPjsVRm
         g5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771243424; x=1771848224;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=msQflfcnwvzaxO2WF5SV3QodDRrU+YL5i1PglUfJitw=;
        b=CX3UlKb8y6PuRQXrGWtcfphR4Qr0iBrapgZCeW3LlmosvYq9kolrSG8qXz7DjsQh4s
         Lr5S6ZJd31FsouSaIhos3Khwshd0NGnHrCKcooxhyRgyW41Rxk9YQrw3o4wtUwpdLaZj
         lcaYTZo9Xk3dkm3ZdczjACMB36CrdHH5/mTv+1rZdvZjL/Wqi3ktaDjUHIXZH2AotHoO
         UNJ4k9AhaTBWrbHOhO2dXaH4EpkKw70IvveE+GvCcwEuFuCqki1C9K1rhf+/+7Jwpkld
         WBqme7jhqLF3BdD0PWF6MjYBk2Irk0H+QEk6NOGm/P4WyO3SpQvtwCTBDpNBxiTFgPOH
         EzVA==
X-Forwarded-Encrypted: i=1; AJvYcCVBOoWMZqeRNKmzCgV52iKM+PX//dQyPiFxnl3m3IOeOVB/dDQVLAQN9Jxsf3c2rnfrans1C/uRJdKs3OQl@vger.kernel.org
X-Gm-Message-State: AOJu0YxK5EyjjxoiudTim6KjcKGFKIjZOoCwJNsizXm0W8UcOl2maDoJ
	hisigYYp99Rz81Ew16T14/PWXXRJmY8enhtfWEU77uOXjWPdKNaY7YbNCS8uw8/aik2Vk89MwQL
	xCAnVv8l9juK1+XLbqQKfVPSa5O8rY59VFihWQ5rtC5MbaOh/AKNPHilmSS2Vao0DwQL1
X-Gm-Gg: AZuq6aLWyq7K868BbSJChPMEEtGQjFXwxP5RnTcXGNCmus1uBdE2ZSb5a3LEIA+hcEY
	AF5DjiyJkQdTOP1kZGL9jXez1XoDaS0U0HyuovQaDohrdwc7PPbfC1Hn+rDBRNL7R8YOpD13szG
	cDT0lIVp2HXn+WJy1zimFWAJxoX9/Ae2azgOPdLDjI5ogDvj5yr2Fjr4c2A14tDe2mf0kV/gNZY
	vkc1uGC1M7q9vH0lFuGB8EQnTnfhAChncV/AQoU9OqRYMWQ3jO6u9WCNn/tSNHGjtrtO6oUVPkV
	uZfjK0t8JOEmK8Dd5zeT3/WotS6KnKAATWULGTuEnL7QqVTKh0OUEjx7xk+ttFANPBHEetbG3U/
	+v2igkl8v6VVAht50DFWRdwykgzCO76RWdzdTFnozxPkqW/EyMSp//ncW4r9LRQK7lEer1thWoN
	oZTUw69WNvpEivfc17t24UiDshwMO+IGfArDw=
X-Received: by 2002:a05:620a:4484:b0:8c5:32a0:3421 with SMTP id af79cd13be357-8cb4ac01d41mr1019159885a.16.1771243423556;
        Mon, 16 Feb 2026 04:03:43 -0800 (PST)
X-Received: by 2002:a05:620a:4484:b0:8c5:32a0:3421 with SMTP id af79cd13be357-8cb4ac01d41mr1019153285a.16.1771243423018;
        Mon, 16 Feb 2026 04:03:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5b6cb1sm3176719e87.84.2026.02.16.04.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 04:03:42 -0800 (PST)
Date: Mon, 16 Feb 2026 14:03:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: iris: Enable Gen2 HFI on SC7280
Message-ID: <fw2zmrpijgzu62jnajqpykplhte2ff3cg333yg4mbb62pq7kem@v2mg7mrf7jjh>
References: <20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com>
 <20260209-iris_sc7280_gen2_support-v1-2-390000a4fa39@oss.qualcomm.com>
 <0da582a6-5bba-4450-99ec-cf57b67915e6@oss.qualcomm.com>
 <0a324898-092b-3e44-c35c-15de20b50f40@oss.qualcomm.com>
 <2uih6xdzarkwnvhlhv5kznmdwo4jorqvsrb7xxrxgr6vprx3ey@4kx45k5i3c4y>
 <6b9042c8-767e-0fdb-9012-f3790899509e@oss.qualcomm.com>
 <f9f40ac7-e6fe-41eb-92e4-311913567ef0@oss.qualcomm.com>
 <b759fb04-22b7-cd5c-9e53-f4ffe9f37dc5@oss.qualcomm.com>
 <nb576n2risxl5mabotlu3idmoztedrblur4gbvdlk4cu3mtiqq@ecezsux4w7jz>
 <c3e8b907-06b9-26d0-50a4-e9b091050b1c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c3e8b907-06b9-26d0-50a4-e9b091050b1c@oss.qualcomm.com>
X-Proofpoint-GUID: 1zADfnQk5CDzwzxvzFfKBIZ57fjerBLe
X-Proofpoint-ORIG-GUID: 1zADfnQk5CDzwzxvzFfKBIZ57fjerBLe
X-Authority-Analysis: v=2.4 cv=M8dA6iws c=1 sm=1 tr=0 ts=699307a0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=eTqMsk7kSW0O_KvlIWsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDEwMSBTYWx0ZWRfXxVnRCG97qgXD
 M9GNt4+Ws7S7kBBvc2dJ+q1D9F8UIVOd2TLGx2ntK1ar3PycJuG8Mv959jm05TccEKVd4hZlSKL
 t6p1nFZbxmW0g2cyCYFFNitFrpQRVJ3mjmk5o8Y5bfR7dMw97tofAJ8AjpBIkJxuIeECNRA0f1O
 QBDNjy6vtkel0np13gNumN8If3D3IQZWbpV48nSG+P03F8OXMdIW3/rvOKlvF+8kTWK0rLKHNRP
 i26mJhO7KNeSf/TWUiYQ0VcNXRSqdF/DrK7wzxTbCEHgaWTPPfmo2/w2C1AnO8Ecn2bemnOYfhQ
 ErgJQnQzfxFKqmiGGEwEwwJCa9PhtN1Z6TJDySf+7ac3ro7nOL3owV+sAEeSRnwGcVdqwhBBi6O
 Lyamzw13eILw76SVqdVIFSTaXHtFCVw3jITDn1EpkQnsTvf3khUSdSUsvQ/0Jj69Bo8sAFp2GgQ
 gvuFqAhQsb5j+yBYUfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160101
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92936-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A6B3E14332B
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 01:53:28PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 2/13/2026 5:34 PM, Dmitry Baryshkov wrote:
> > On Thu, Feb 12, 2026 at 06:35:19PM +0530, Dikshita Agarwal wrote:
> >>
> >>
> >> On 2/12/2026 5:13 PM, Konrad Dybcio wrote:
> >>> On 2/12/26 12:16 PM, Dikshita Agarwal wrote:
> >>>>
> >>>>
> >>>> On 2/9/2026 6:05 PM, Dmitry Baryshkov wrote:
> >>>>> On Mon, Feb 09, 2026 at 05:04:48PM +0530, Dikshita Agarwal wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 2/9/2026 3:32 PM, Konrad Dybcio wrote:
> >>>>>>> On 2/9/26 10:45 AM, Dikshita Agarwal wrote:
> >>>
> >>> The only SoC with such distinction today is kodiak. So we can simply check:
> >>>
> >>> if (kodiak && strstr(fw->data, "VIDEO.VPU.1.0.")
> >>> 	hfi = gen2;
> >>
> >> Agree, this works for Kodiak. However, Dmitry was also referring to other
> >> SoCs that may support both Gen1 and Gen2, and at the moment there isn’t a
> >> generic way to handle that check.
> >>
> >> Also, please note that the Kodiak Gen1 firmware uses the string
> >> video-firmware.1.0, whereas Gen2 uses VIDEO.VPU.3.4.
> > 
> > This is not quite true. Kodiak Gen2 uses:
> > 
> > $ strings /lib/firmware/qcom/vpu/vpu20_p1_gen2.mbn | grep VERSION_S
> > QC_IMAGE_VERSION_STRING=video-firmware.2.4.2-d7a3d5386743efb16b828e08695bea7722cafadd
> 
> This is not the correct firmware for gen2 to work with kodiak,

Then what is that firmware file?

    qcom: vpu: add video firmware binary for qcm6490

    Add Host Firmware Interface (HFI) gen2 based video firmware binary for
    qcm6490.

I cannot interpret it in any way other than "Kodiak firmware
implementing HFI Gen2". What does that commit message mean then?

> the correct
> firmware (not posted yet) would have VIDEO.VPU.3.4.*

I don't understand, why are you making your life harder than it is?
All firmware for HFI Gen2 uses different version strings (as outlined
below). Why all of sudden you want to change that for Kodiak?

> 
> Thanks,
> Dikshita
> > 
> > A collection of versions quickly captured from what I have here (for
> > different chips, but for the overall picture):
> > 
> > HFI Gen1:
> > 
> > [skipping prehistorical / museum data]
> > VIDEO.VE.5.2-00023-PROD-2
> > VIDEO.VE.5.4-00059-PROD-1
> > VIDEO.VE.6.0-00055-PROD-1
> > VIDEO.IR.1.0-00005-PROD-4
> > VIDEO.VPU.1.0-00119-PROD-2
> > video-firmware.1.0-6804c210603073037fb32640a3dd6a46fe04edd6
> > video-firmware.1.0-7da9db401e417a006ef915d6c4323f00cdbcf40a
> > video-firmware.1.0-ed457c183307eff1737608763ca0f23656c95b53
> > video-firmware.1.1-84a8080bf84fa9ab15b353bf03bea6e548d89d2f
> > 
> > 
> > HFI Gen2:
> > vfw-0:rel0095-d1a9e7c4a274aa13e4136500d19262f87ef2c921
> > vfw-3.1:rel0085-070fa3311d9ef968015fee7fea07198d7eb208a1
> > vfw-3.1:rel0093-7925621ff52ecb7b1565341042c4e5ffd4fc76ce
> > vfw-3.5:rel0040-1ded01d0e6dcaef08b8155fd5a02f5b57248d5ca
> > vfw-4.0:rel0045-25b39e81446baf48716df98dd37099a2103d36ee
> > video-firmware.2.4-48ec04082362ef1922fec5e20e22f7954b11d736
> > video-firmware.2.4.2-d7a3d5386743efb16b828e08695bea7722cafadd
> > video-firmware.3.1-e5aea20c64cb6df9a1c9be99e206053b36424939
> > video-firmware.3.4-e299f99ffcd086b43a2ccc7c3279ce5df404d693
> > 
> > It seems we can assume that Gen2 is:
> > - vfw-0
> > - vfw-N.M
> > - video-firmware.N.M where N >= 2
> > 
> > All other binaries are Gen1.
> > 
> > Also, we don't even have to query the binary firmware blob.
> > After the firmware is started, you can read the version string from
> > smem, saving us from strstr over the firmware image.
> > 
> >>
> >>>
> >>>
> >>> Can we agree that VIDEO.VPU.x firmwares are hfigen2? If so, problem also
> >>> solved for <=8450
> >>>
> >>
> >> Nope. that's not true for all, SM8250 uses VIDEO.VPU.1.0 which is gen1.
> >>
> >> Thanks,
> >> Dikshita
> >>
> >>> Konrad
> > 

-- 
With best wishes
Dmitry

