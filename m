Return-Path: <linux-arm-msm+bounces-80213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 592E2C2F55A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 06:04:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08BAF3B10E1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 05:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 007CB29B8E6;
	Tue,  4 Nov 2025 05:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I78XV9mk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SV5Ad4HU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A022609D6
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 05:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762232642; cv=none; b=stZV4UItrptR7oKqdq6JZ7HLntbJLI8nM4uDzmoKxadEwFL6GKEpNgVfIrKql+3OcjlkQsHQOki0nAEAg+mXU1xeIa8gHN2Pue4xfqAxoJ0CEpFScFjED/vjpYYHwCiKU47xk8VdgJzTevE2/1QjWGBonzXD4k9+x4NNiJy2iEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762232642; c=relaxed/simple;
	bh=7ahORK56Ji+xG3X89Vnujuhts7WNYej9lQCD0HUx3QQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WwJBOcXlZoAV3l/3N/g3OwkGYkcuEXHNbMoDoBW4M4OhyxzjvJd6r6OznqZ2RzT7MxhEvjkMs4SFJzwRVaBjA0ZMDvdBJVuL7QHByzodkhquwJkBXJ9MHDw9GZ4e0aOnLzMTmDgl2v5i3OkYwMvb3lj3jB5nZ6AlETcMz9SozbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I78XV9mk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SV5Ad4HU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A43JucZ3729661
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 05:04:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1lcbXDQCbFGlQ1qumczHxP0u
	BwOAwPqDfJc9RgHWN7Q=; b=I78XV9mknreU+VPqdvJZhXARFXwLPyzdskoZgal1
	IDmo90cjvNmLwLgBNGwsO7j0F6ogiXgxbIAQX040z1oMFF+oYHUKiHHIx/Iff2ak
	Wtv48k+BEtU9GHM+UHq8OCaYLABx0XqeW1D4eDbeFeMYoag2QA58JwiPA2ogEFqn
	ZFJJduvGj3xZCSBxNvk/S4+f2fXCDQC6zi8Gw3UeCWKmB3DEpI7GQe9DR/9hI9zL
	Y/hpINGnlrLKiaJrgrVj2akLIXR8FAsiHDzVVrlmbnxzSIMvFZWO3AjvBkj2vdOT
	55zzx/7uA84x1Dc3FiSaNf/MK8S/x1rXuq6hAp1A6YvaZw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70p89n45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 05:04:00 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b471737e673so8477420a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 21:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762232639; x=1762837439; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1lcbXDQCbFGlQ1qumczHxP0uBwOAwPqDfJc9RgHWN7Q=;
        b=SV5Ad4HUoU9w8kN57ksZ9iYwhZ8ahNo/4P6my8wXay8SFKDuY+18096PeEc6JiPIIb
         MTGDqljVHAAPnSmRHzMkV8yfyhe6W5XGeW6bYXhSGZ6cvIKRlSWGCp6FvqgjDsPMcoqx
         u3xOyo5jX2+0bsyU9JukWyASYKGNWsPwisV9ek7x4NkWGPUjgRuuwMLSXXm+KAI3AXSo
         zWBQiiwN/oWIYOQF0vruWK1pCK1/Ir8moYd2IhWmy/8FT0ui9CyfCXghM+OP+7dLMpFo
         8tZfKgjeEo9i+fRrfJ8ezLzb34SeJal8l184qBE9nkU09prT6TJDh1Qn5GnNKJXW4jCn
         /GDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762232639; x=1762837439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lcbXDQCbFGlQ1qumczHxP0uBwOAwPqDfJc9RgHWN7Q=;
        b=ntA8W2zar19uVbMgWgJKtYrZ82aTLSPjbYITT27LdM6r3+JxNfWRyElqCv3dHz0NaO
         agpcD3FhUeDaboSS1PxrgOKrI8GmNGingHxzPo/CJM3EGbId92fPJW20hUAajGLNjkqQ
         DvG9fm7ufDsXDtYlb/4y5FVKAOfDQLIkRDR6Ga6CEe/TKqH8Y9QQzW5dvoMFp/DRPqUw
         hObfmBiMptssEr7OJjbKIimH/FO3oD10yGe7Ne0Ugh4CIhPGvOFT1IKXHKZJ+ngjTWsx
         mMdcQrrs/vQUduUuR2KTJOHV3yfpQi7mYzUzwToBKPCql50J58ddKI2obrnXjtJ0pdDQ
         zUcA==
X-Forwarded-Encrypted: i=1; AJvYcCV98ke/rHWzua4OaqZvnJLKl0XZzdlh7b/pCQlHkG6QwqN/l4jsj4uHkQTgVHuwp5vp7lXTsgZBYcnWGC50@vger.kernel.org
X-Gm-Message-State: AOJu0YxUEWnFRdkYrY/dWnkjklt0uGRECoT6j1rDKGl9JR+3zcshBqHE
	rQ042Z0WgLN/ogZKufySe3A0vtgwRoJrRIK48BP4rFt9QEx1ke/MAAlXJL3Ohnqvj8cV7lgcUpy
	NjR5hmCUJDGcc5iB8ddmElo4WTIhEvO1U97GiW5pmc4t/096v4D9fv+9lE0/rO9s6ojGV
X-Gm-Gg: ASbGncuJLSLCOMJ+6wYMxOGZVOO3MtDWjVhm0nljWoH0iA7gWZS5AEKW6sXTgWX8Wy+
	/Z//wHVdbeShnbOAl3MajghB0KHGQ8c5zcWbRqyKE1lzaH05D904VVYKiNQW7AegsywLhNHAHRU
	CbOFG2BLfxL1S/ZwzK0N7ljnhHCJJuO4qB+RvwFiSWlYtGx9X0n+dRxb/QDoNTMWAJVuudSt8V+
	uUGOwvHgAMgR1ViHzg13fnImQJYg5wOrH/HaUaHoriLtwE9y1sS98Z/YmcNSeay4ljAQIOcn24E
	wlsjHKjUDNnmWqi6J6ngcWGCPGg+22JLgYe1IT4viC4kZYER2olnDbxHq9osg3xd2KC6XGyRCEx
	UXScX6fjrc7U+P6Kkn2MeFscMKqfvxaL1
X-Received: by 2002:a17:902:ea0e:b0:273:ab5f:a507 with SMTP id d9443c01a7336-2951a3e6136mr219335005ad.21.1762232639507;
        Mon, 03 Nov 2025 21:03:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXmDw/J8solbX98U9JGXASqPQ7jI05mi4jRrsOQx95DzTgD/uBh8QIFNA96fGs16AgEAxB7A==
X-Received: by 2002:a17:902:ea0e:b0:273:ab5f:a507 with SMTP id d9443c01a7336-2951a3e6136mr219334525ad.21.1762232638744;
        Mon, 03 Nov 2025 21:03:58 -0800 (PST)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601998671sm10391285ad.35.2025.11.03.21.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 21:03:58 -0800 (PST)
Date: Tue, 4 Nov 2025 10:33:52 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/2] soc: qcom: smem: Register gunyah watchdog device
Message-ID: <2ef1d795-5cdd-4465-9333-16a02207a806@quicinc.com>
References: <20251031-gunyah_watchdog-v4-0-7abb1ee11315@oss.qualcomm.com>
 <20251031-gunyah_watchdog-v4-1-7abb1ee11315@oss.qualcomm.com>
 <nnq34bfbbi3satxiqzaouy5pgi3obyqp76avh2ipyqxx6w67td@e7eqehjq7iww>
 <40a6395e-26f6-4bad-88af-d89479b6fc28@oss.qualcomm.com>
 <abicharluq6bm7gbngkbdc2hobcfifcmazh7oukcoufsrpcpse@ml2wccwe6s7i>
 <599188b5-cd2e-4667-a91d-04cbdd62cecb@quicinc.com>
 <ykg7mwgncmvdap6xzyhmgxu6ur62zzfk5nd3tqrkivugn4w474@rkazrlhwbhtj>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ykg7mwgncmvdap6xzyhmgxu6ur62zzfk5nd3tqrkivugn4w474@rkazrlhwbhtj>
X-Proofpoint-ORIG-GUID: V53KWkm6SAPFbTjzxgVDndQKRSm08I8T
X-Proofpoint-GUID: V53KWkm6SAPFbTjzxgVDndQKRSm08I8T
X-Authority-Analysis: v=2.4 cv=AsnjHe9P c=1 sm=1 tr=0 ts=69098940 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=yMhMjlubAAAA:8 a=EUspDBNiAAAA:8
 a=NmRg-prKhgx6galY42cA:9 a=CjuIK1q_8ugA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDAzOSBTYWx0ZWRfX3CX0/dzcjdtz
 /1/MSDIRpPqy5bwUYrs0Fbk10VZ7NKqtw3/1tkrdZ++LGoRkFI2BuiyW771v8kzWzIavfQjlpOd
 /RebzOO88OpXhnlTMEdVOHyew3OM3LeQ0OkVRWtAaoCMgWJhiSBXnLy0CkWLyu/v4PehxLtthyJ
 HuYDhiG6lbglq0buxIVOTCxg8ZXom6+tkQlnfbbpwGINjWsAKRkBX0gVxQiima0zcrurE/aYANh
 8NKr1R0PmUjx/QfbdSedK12UWEJSDDEZ/l95EnsjwfpMIFRBl9QcnpP9X7dN0uLgdyBmGTpuG/S
 /5b6P4hwwbDT+/8N1NYtAzlnemIZipJywI9pAy3Cz3PjAE3gpJ5utwx82M11nDhNzD3a2wyYgMM
 WxxqguJmlRfkH5C8OzbQKFs9Saxkwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040039

On Mon, Nov 03, 2025 at 09:52:25PM -0600, Bjorn Andersson wrote:
> On Tue, Nov 04, 2025 at 09:00:27AM +0530, Pavan Kondeti wrote:
> > On Mon, Nov 03, 2025 at 07:01:51PM -0600, Bjorn Andersson wrote:
> > > On Mon, Nov 03, 2025 at 04:03:44PM +0530, Hrishabh Rajput wrote:
> > > > 
> > > > On 11/2/2025 12:15 AM, Bjorn Andersson wrote:
> > > > > On Fri, Oct 31, 2025 at 10:18:13AM +0000, Hrishabh Rajput via B4 Relay wrote:
> > > > > > From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> > > > > > 
> > > > > > To restrict gunyah watchdog initialization to Qualcomm platforms,
> > > > > > register the watchdog device in the SMEM driver.
> > > > > > 
> > > > > > When Gunyah is not present or Gunyah emulates MMIO-based
> > > > > > watchdog, we expect Qualcomm watchdog or ARM SBSA watchdog device to be
> > > > > > present in the devicetree. If none of these device nodes are detected,
> > > > > > we register the SMC-based Gunyah watchdog device.
> > > > > > 
> > > > > > Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> > > > > > ---
> > > > > >   drivers/soc/qcom/smem.c | 37 +++++++++++++++++++++++++++++++++++++
> > > > > >   1 file changed, 37 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> > > > > > index cf425930539e..40e4749fab02 100644
> > > > > > --- a/drivers/soc/qcom/smem.c
> > > > > > +++ b/drivers/soc/qcom/smem.c
> > > > > > @@ -1118,6 +1118,34 @@ static int qcom_smem_resolve_mem(struct qcom_smem *smem, const char *name,
> > > > > >   	return 0;
> > > > > >   }
> > > > > > +static int register_gunyah_wdt_device(void)
> > > > > > +{
> > > > > > +	struct platform_device *gunyah_wdt_dev;
> > > > > > +	struct device_node *np;
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * When Gunyah is not present or Gunyah is emulating a memory-mapped
> > > > > > +	 * watchdog, either of Qualcomm watchdog or ARM SBSA watchdog will be
> > > > > > +	 * present. Skip initialization of SMC-based Gunyah watchdog if that is
> > > > > > +	 * the case.
> > > > > E.g. qcom-apq8064.dtsi doesn't define either qcom,kpss-wdt, nor
> > > > > arm,sbsa-gwdt, does that imply that it implements the Gunyah watchdog?
> > > > 
> > > > 
> > > > It doesn't implement Gunyah watchdog. For platforms like these we've kept a
> > > > STATUS SMC call in the gunyah_wdt_probe().
> > > > 
> > > 
> > > I think it would be good to make that call before registering the
> > > platform driver.
> > 
> > Did you mean platform device here? Becase we don't want the gunayh-wdt
> > module to do anything other than registering the platform driver on
> > platforms other than qcom.
> > 
> 
> Yes, device, not driver.
> 
> So in SCM driver (I think that's a better match than SMEM), do a:
>   if (are_we_running_under_gunyah())
>     platform_device_register(gunya-wdt);
> 
> The Gunyah WDT _driver_ should based on that be autoloaded by the
> platform:gunyah-wdt alias.

Thanks for the clarification.

> 
> > > 
> > > > The SMC Call is expected to fail on platforms which do not have support for
> > > > SMC based Gunyah watchdog, which in turn will fail the probe.
> > > > 
> > > 
> > > Perhaps I'm missing something, just looked quickly and it's been a while
> > > since I looked at this code, but you're making a HVC (or SMC) call with
> > > the function:
> > > 
> > >   ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_32, ARM_SMCCC_OWNER_VENDOR_HYP, 6)
> > > 
> > > which doesn't look unique to Gunyah in my eyes.
> > > 
> > > If I read correctly, the ARM_SMCCC_SMC_32 is the only bit (literally)
> > > that differentiates this from being a __vgic_v3_get_gic_config() call in
> > > KVM, just as an example.
> > > 
> > 
> > Yes, you are right. This SMCC falls under ARM_SMCCC_OWNER_VENDOR_HYP
> > space, so it would behave differently on different hypervisors.
> > 
> > Please let me know what you think about this **defensive** approach.
> > 
> > - Move the Gunyah platform device registration to SCM driver.
> > - Checks to be done before registering the device
> >   - Make ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID SMC [1] to verify that we are
> >     running under gunyah
> >   - check for the other wdt devices like kpss, sbsa in dT
> > 
> > ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID SMC will not be supported by all
> > versions of Gunyah, but atleast it would confirm the definitive presence
> > of Gunyah.
> > 
> 
> Yes, this looks good.
> 

Thanks, I think QCM SCM driver hosting this would be a good idea.

> I presume if we determine that Gunyah is present, and we haven't put
> sbsa wdt in place (e.g. during bringup) Gunyah and Gunyah WDT will
> handle the outcome gracefully...
> 
Yes, we are told Gunyah support SMCC based WDT even if it emulates
SBSA. Most importantly, we have STATUS SMC in gunyah-wdt probe before
registering the watchdog device.

The following two patches which merged recently will make the above
implementation simpler. Providing them here for the reference material
for v5.

- arm_smccc_hypervisor_has_uuid() API addition from
https://lore.kernel.org/all/20250428210742.435282-2-romank@linux.microsoft.com/
Please note that recent commit make this API available for SMC conduit
as well.

- qcom_scm_qtee_init() example from 
https://lore.kernel.org/all/20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-2-17f07a942b8d@oss.qualcomm.com/

Thanks,
Pavan

