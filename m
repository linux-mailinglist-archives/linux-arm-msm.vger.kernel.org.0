Return-Path: <linux-arm-msm+bounces-56119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CBCAA0B6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 14:22:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3B6D5A4E10
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 12:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9427225768;
	Tue, 29 Apr 2025 12:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CMMxtx4B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEE8524F
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 12:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745929328; cv=none; b=FcDKGju2zN1/Gsa34UXCcb+ECc6CDgZqqKNRWjvSt/+ATkKNCarKOgMPAl5NMhLryzb4Rxml2M3MzrC9p69BASe1QxRRI6p3QDjeQ7xFOqdgClOxX7WeICv4M1ZHNaSy6qxtyon0H0rHAS8hVfbASCPYwRM6LfZwDwWn9Y84i/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745929328; c=relaxed/simple;
	bh=rlkoMh2C9VM0QAvGszpiyITfN4gKhaKKUVRLWB0+wug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQew9H0s97VvDAU3Qkw1VoXLU6eA7DhfkBdO7MkYUO6BqMZeBTXE2ryLSjpnoFNBaLbJaiuCHbOOpTx1oqb5/7s6wsaGD1SKTyM5jK/Ogxc1mr6Y+4ldBwXXtw1D69oCQw8QJJjCkhx9rIZNwMaszd5/DAkUSL9jM4aXC8FdIP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CMMxtx4B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9l1xx001785
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 12:22:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QcqwnwlHX4Z7g+pEyqpwef5F
	AfNnWZYqyTef36MWiSk=; b=CMMxtx4B9jPSZe3py7ltz0n8emdwll2FMbvhzOnz
	jHT4XpT2jTmunVANIjpC85V5irCvH3ErFhEJajZnn/CJ+djeUjhPdezhW/9sEbiS
	WgTC3GYcAH8WtFwPvApbQyxFYpPuh3ZWAbMyY5MMDuk+ndRLXcbtQnU0Kg5MmcUV
	YDDJm1I3jI1g0ta4keG8qBhC7hNLvSHPanVwj+7N4tNaGnXS+Q644L4CrakAJt4L
	hJpaa8OArb2e2WeNClFcCElKIjgtvcmMTwpLkipgsrfPXl35lJHCn9/UCXw3P1JB
	emozPa15yAwCecRxo9NeF+bVQhFyquD1nUyb3fQ7/QQmVw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qv9mgap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 12:22:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so983362985a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 05:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745929325; x=1746534125;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcqwnwlHX4Z7g+pEyqpwef5FAfNnWZYqyTef36MWiSk=;
        b=vo8Kl0Vzng0WUHLwuTUmOG36QnxfWDZxEQWvxiXhMq9mlre+ODQP8kX8n/yDX+h2kU
         iILjuYgFKYB8Ru1OpFsIP3XdfD9qOrHTP8V5HMVFgEpJoaktFYn3JAdpQDqmIx1A5MqE
         oyLSlHihAlRCFEGZJ8WBAxdiUjXxn/e53fFyjNdSzA2rSbbPRk82I468c7QmbGdiJqOX
         SmZQaZlXuurfEGSWA+lhPUdzg1zZDsMA+KMncQLUBXPmKctQSNwoOU1j+IvcJaOag8bx
         rZ86ktN/r62Ej26sSgyYFzjQSzf3E9PUC4cuxLyK0ybgkuOXTHzPcMPbR6rz6l6Ahu1l
         F9Sw==
X-Forwarded-Encrypted: i=1; AJvYcCXKzJk6B0JkpHyq4b+z5Jwdm7pLjeVVdKNIvX56CDmccf4Ty6ROv6va01a32DLDegZXan2IbrSvhRVEVfUK@vger.kernel.org
X-Gm-Message-State: AOJu0YzgS0dzj8uwUMAxMSg4WY799wGhJT4zxUqHwHBeA+ToGjUT5JXP
	mAYPWu3ZmITmGNjie5qR7g+puqRYNLWAhBQrqlJH8hfwc2sIACzs9Sj9LYTAhEOBadUelHJTAMe
	zncKAdm4+RNGXtO0zlK2YULMSkYzveDA+H4kwwd9g/QDE3BAf9GqmOtZfYWxMwEtF
X-Gm-Gg: ASbGncsAUl7/WFzxRSOe1IGdpuj333CH9nYsBWUgICjACkTFsdB53iYB4J9BCH+j/Ty
	880ZfesFMCzAHAzeQp9mXwiav/RFqEKR2k38XgetO7gXwLl7DdWM7P5DmSU2FsLNrq864tKPXDB
	dJpW0rIcabggrxCrvQIIuH1/Y7wrizZg4yHxRqaA1QapuA1b4pCElhf1UXm2fQFXLYKS6FbZidA
	JmL/DsbHwb6WIaOMaDIx3T2hxeIHOdJlo9RJAALcq2PW9z7jr/tYI4lqHpWHz0ey/Z3aI9fc+Ld
	fzu0FjKYrwzBucwehTiItCknvSNwHhhm2mdqX32rcF9I3ngihKkfs+r14QCsbYNFqO448sYtzMs
	=
X-Received: by 2002:a05:620a:40d3:b0:7c5:61b2:b95 with SMTP id af79cd13be357-7cabdd8f731mr514280885a.30.1745929324906;
        Tue, 29 Apr 2025 05:22:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXUL9I45JsNu/1ShN5rznOiRCqQpVxxM0mjrjN1AEZ7KRlQcxcgY7B6F6Mg/kGlZUGDVSXyA==
X-Received: by 2002:a05:620a:40d3:b0:7c5:61b2:b95 with SMTP id af79cd13be357-7cabdd8f731mr514274985a.30.1745929324388;
        Tue, 29 Apr 2025 05:22:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb2635dsm1882207e87.38.2025.04.29.05.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 05:22:03 -0700 (PDT)
Date: Tue, 29 Apr 2025 15:22:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: neil.armstrong@linaro.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8650: add iris DT node
Message-ID: <4qvz7jcslwfd72ulrjrbp5fya6fbqkfrph7j4byf6vkw6dcz23@ialiag6o4wiv>
References: <20250424-topic-sm8x50-upstream-iris-8650-dt-v2-1-dd9108bf587f@linaro.org>
 <3498cfda-a738-449d-9d9f-754bbc8125c2@oss.qualcomm.com>
 <db91a526-e2f8-48f8-a071-f3fcc75235be@linaro.org>
 <CAO9ioeWaPKXHgNGPx5q34+RP59PMLD+EVK5fQsN89KC9A1ca-Q@mail.gmail.com>
 <d79790e5-52c9-4135-8f3c-af797145fa2d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d79790e5-52c9-4135-8f3c-af797145fa2d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AO34vM+d c=1 sm=1 tr=0 ts=6810c46d cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=cUhgIWFcHcWmCc0EzucA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 6WptATitxuZVJYx3zEuDLqeL70vh9KA_
X-Proofpoint-ORIG-GUID: 6WptATitxuZVJYx3zEuDLqeL70vh9KA_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5MiBTYWx0ZWRfXxAkSeKQcmN2x ijdpPnYdCHlTdnh1OLChfpWQckbpSYxxwn+7oLnUMXj9mQiNR6IpI8UDq7xtBIfH6OnZzFsb8Ke hlAP0mvPfGphxD+OA1jkZKwZIon4Z9jL/qscpBfGJ9L2WNGys1ONN6vPArB2MRDzFNnuirabOqL
 Vmo/RRo4Zbfu6l57O8MhQiEBsiQYVZVTGTQFBMV0AlUl6iUkb0P+cQd7eKtvllCzEV4dgIHZ5Gz vdtPfRB+dIOnL+yrBJbOuyFXIGf8rIoD3+I4x9+93E/aOGCh+G5FvnMuqluK/uv01ahdoUPyahh lpoQG+WotJkpwFf9pFZfWPVfndSKr72HRcnHOP8SX4hlaVjuXkdknvm2xwDt5WLW5XAVw3xYjoL
 aedpg+z1lbXZrSQ7vV/LYy1mgAuBC+bzC/UwnaUJLrfgKA884ScPAn3788mLlEHQOZJKqUwj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290092

On Mon, Apr 28, 2025 at 11:14:18PM +0200, Konrad Dybcio wrote:
> On 4/28/25 12:48 PM, Dmitry Baryshkov wrote:
> > On Mon, 28 Apr 2025 at 11:18, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> >>
> >> Hi,
> >>
> >> On 25/04/2025 23:49, Konrad Dybcio wrote:
> >>> On 4/24/25 6:32 PM, Neil Armstrong wrote:
> >>>> Add DT entries for the sm8650 iris decoder.
> >>>>
> >>>> Since the firmware is required to be signed, only enable
> >>>> on Qualcomm development boards where the firmware is
> >>>> available.
> >>>>
> >>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >>>> ---
> >>>> Changes in v2:
> >>>> - removed useless firmware-name
> >>>> - Link to v1: https://lore.kernel.org/r/20250418-topic-sm8x50-upstream-iris-8650-dt-v1-1-80a6ae50bf10@linaro.org
> >>>> ---
> >>>
> >>> [...]
> >>>
> >>>> +            iris: video-codec@aa00000 {
> >>>> +                    compatible = "qcom,sm8650-iris";
> >>>> +                    reg = <0 0x0aa00000 0 0xf0000>;
> >>>> +
> >>>> +                    interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>;
> >>>> +
> >>>> +                    power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> >>>> +                                    <&videocc VIDEO_CC_MVS0_GDSC>,
> >>>> +                                    <&rpmhpd RPMHPD_MXC>,
> >>>> +                                    <&rpmhpd RPMHPD_MMCX>;
> >>>> +                    power-domain-names = "venus",
> >>>> +                                         "vcodec0",
> >>>> +                                         "mxc",
> >>>> +                                         "mmcx";
> >>>> +
> >>>> +                    operating-points-v2 = <&iris_opp_table>;
> >>>> +
> >>>> +                    clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> >>>> +                             <&videocc VIDEO_CC_MVS0C_CLK>,
> >>>> +                             <&videocc VIDEO_CC_MVS0_CLK>;
> >>>> +                    clock-names = "iface",
> >>>> +                                  "core",
> >>>> +                                  "vcodec0_core";
> >>>> +
> >>>> +                    interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> >>>> +                                     &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> >>>> +                                    <&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
> >>>> +                                     &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> >>>> +                    interconnect-names = "cpu-cfg",
> >>>> +                                         "video-mem";
> >>>> +
> >>>> +                    /* FW load region */
> >>>
> >>> I don't think this comment brings value
> >>
> >> Right
> >>
> >>>
> >>>> +                    memory-region = <&video_mem>;
> >>>> +
> >>>> +                    resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
> >>>> +                             <&videocc VIDEO_CC_XO_CLK_ARES>,
> >>>> +                             <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
> >>>> +                    reset-names = "bus",
> >>>> +                                  "xo",
> >>>> +                                  "core";
> >>>> +
> >>>> +                    iommus = <&apps_smmu 0x1940 0>,
> >>>> +                             <&apps_smmu 0x1947 0>;
> >>>
> >>> I think you may also need 0x1942 0x0 (please also make the second value / SMR
> >>> mask hex)> +
> >>
> >> I don't see 0x1942 in the downstream DT, and which mask should I set ? 0x1 ?
> 
> I saw it in docs only, maybe Vikash or Dikshita can chime in whether it's
> necessary. It would have mask 0x0 if so.
> 
> >>
> >>>> +                    dma-coherent;
> >>>> +
> >>>> +                    /*
> >>>> +                     * IRIS firmware is signed by vendors, only
> >>>> +                     * enable in boards where the proper signed firmware
> >>>> +                     * is available.
> >>>> +                     */
> >>>
> >>> Here's to another angry media article :(
> >>>
> >>> Please keep Iris enabled.. Vikash reassured me this is not an
> >>> issue until the user attempts to use the decoder [1], and reading
> >>> the code myself I come to the same conclusion (though I haven't given
> >>> it a smoke test - please do that yourself, as you seem to have a better
> >>> set up with these platforms).
> >>>
> >>> If the userland is sane, it should throw an error and defer to CPU
> >>> decoding.
> >>>
> >>> This is >>unlike venus<< which if lacking firmware at probe (i.e. boot)
> >>> would prevent .sync_state
> >>
> >> Well sync with Bjorn who asked me to only enable on board with available firmware ;-)
> > 
> > I'd second him here: if there is no firmware, don't enable the device.
> > It's better than the users having cryptic messages in the dmesg,
> > trying to understand why the driver errors out.
> 
> I don't agree.. the firmware may appear later at boot (e.g. user installs a
> small rootfs and manually pulls in linux-firmware). Plus without the firmware,
> we can still power on and off the IP block, particularly achieve sync_state
> regardless of it

Yes. But the firmware should appear at a well-known location (rather
than a default one), so we are back to the question of having the
firmware at all (even potentially). I really would rather not having
users / developers trying to put qvss.mbn firmware into the default
location at qcom/vpu. Likewise I don't think we should have users face
cryptic errors if the firmware from linux-firmware is not suitable for
the device. With all that in mind, let's follow our standard approach
and not enable firmware-backed devices by default.

Also, if we define the device as disabled, we can reach the sync_state
too, can we not?

-- 
With best wishes
Dmitry

