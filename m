Return-Path: <linux-arm-msm+bounces-55906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFA9A9EE4E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 12:48:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7F0F7A3CE1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 10:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7093261588;
	Mon, 28 Apr 2025 10:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W5TDMBOq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0857224244
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 10:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745837299; cv=none; b=Z9u+y5iHX/nyjN8wxgiYAoGOtV5h0ejtq6ngu6WP9OYc4sMRQ/kHsg6CdLetXN7xsLrEgdRnEJ5kPvcBgDbJP7a95Rn+obTRDiccoW6Tsg/owhqK3CWGuh93yt660CJ4Fj9IBCWe7FtnrnpK2sGLR6Y7w9o+xkYy+OX2/3C/Aqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745837299; c=relaxed/simple;
	bh=6YaMRruSKDhDVQKJzK/GHN7Jqje7g4DJLjL3B27hCKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tSiZxF/rEI7P8ROzd8mVBoJpzPVbiwsVKXAQazwjCWbsvIxY7E9D5S/MiP952lY5wzZpgaaFJDi3GCrJCf2Z7Ne1iJlupUK4yc3B2GJaIxY3TCiSRRFjdoan0di5uNu6TCyzDCXl9+COZzo1G8U0hKBhgrQ43d1wDeAPNNfcKek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W5TDMBOq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SACQSY023749
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 10:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F0m7HB2gG3d25Nu5nZtS4On6
	8RruYWwoqBowuaqRdr8=; b=W5TDMBOqYoXDyP5lHzeOn9yiu4gTNjj15jNoyxSs
	aomryXUgcHM1mshkNRSm80p3tw7N0Vb1WSVbdPbXpYx2ax+uS9cXPtEkG3PxXikm
	uiqtO+xSdjnECA8dtfMpJH3mvwNYVzH9Kkoqy5ZcUI1oo0maWG3fgzjpmzOYR2s5
	UHk4jLZeOpAzdl+BsyeNwaPkApe5N5PvlPyxtmPhOgGvXoMGzfqtBvrCaqfNIIY9
	ufxPc8/m2WGyK5lF7wMu2aV7cMWHCjf8y2EuMV95fKPxdl708thrCZwNuZBMjMXn
	RPwqpr0Wwzp/cyzhfRRve5XIfEyl1RG/OFF0RTT1gyDZdw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468ptmgvbd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 10:48:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff52e1c56fso6464532a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 03:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745837294; x=1746442094;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F0m7HB2gG3d25Nu5nZtS4On68RruYWwoqBowuaqRdr8=;
        b=X6yIhxJPzmPuBc2eRncw3EaaH7OcVLNk2e944vUIsnhqydOSW1x2LzvAMYHPEy2nF3
         CkdXKw358xGbHCOLXvmaatwBfHzE7wrU4ly46QoFcP7pNdxSz0vDw9rP1h92XRs8n0Bf
         YD4BPbu9bZxAVZHyMy3Mo6im2V8o4eVzxa9wv+yGoPfa7ouHkk9Tiy26p1fyLEggYvxh
         Aar71crLBsJNiiqvvxWwwjbfuBCWNWeyJrTIg0kUam+N7CIP+LOub4BCcianQ5E/wFUp
         gPamQIvlN6tTdkRGjn1+7v84iPDmMbtjLKtpRD7i80uhHbm2jEn4p2/Mr5Mp5f02lR4r
         aqvg==
X-Forwarded-Encrypted: i=1; AJvYcCWemQRlm4Vl3sCoH8ZDisiSpH+gFvtJ3ifTNhtvCPBjqmjWiJB3Id1VkPuKx23K3KGNutWW4bKt8gzVGwzi@vger.kernel.org
X-Gm-Message-State: AOJu0Yy810pP5F2qmEEcILBy0W4pbiBBxng7yMwP5jwYy0HNJLulbbly
	WsK9DYvaNlBE2/7LnVGg68QqEAQi1YE/sNcIsq73VkrpCJUD1Ojloehfnn0u4/HArCl0a5Fctky
	w9kPi3FFxRqdeFZOCBaLGNJP/rOYmADgBjttTK3PMFpGj6a1C2ncll+78oLr2TmRvO7pNyKj7m9
	x/hqxyCEWH2wdFSsi3qMHSOYM7ASKosCWjiBLh4nQ=
X-Gm-Gg: ASbGncut1CG0bl8X/4FZEfJfTdtOEgni4aqhnvJ9Jseg9b5DuO3nq6lslh4s738fZ5/
	sjORTqmCclJlzd4XKQq7TkCzyjCb+BsGJhxrFc2VZXKdehOLwyDDHJ7QF0VUNP63a0f5uG5aSYJ
	Hlc87qV9uFZnC3gwEGljTYZDLq
X-Received: by 2002:a17:90b:544b:b0:2ff:6f8a:3a13 with SMTP id 98e67ed59e1d1-309f7e702a1mr15271326a91.25.1745837294040;
        Mon, 28 Apr 2025 03:48:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZ59/NEfTDF0sONov5/AlmGKX/lTawDzVwJVYT7OQJ+dbZoKTjdF2IlugQryRmC8LINKDjP08T1i4NIbEwqaQ=
X-Received: by 2002:a17:90b:544b:b0:2ff:6f8a:3a13 with SMTP id
 98e67ed59e1d1-309f7e702a1mr15271296a91.25.1745837293691; Mon, 28 Apr 2025
 03:48:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424-topic-sm8x50-upstream-iris-8650-dt-v2-1-dd9108bf587f@linaro.org>
 <3498cfda-a738-449d-9d9f-754bbc8125c2@oss.qualcomm.com> <db91a526-e2f8-48f8-a071-f3fcc75235be@linaro.org>
In-Reply-To: <db91a526-e2f8-48f8-a071-f3fcc75235be@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 13:48:02 +0300
X-Gm-Features: ATxdqUFAaKexOX2IHkjlmnbJ-GEkMa25-C3pZEEy-BC23E_yx5Vsy9avMqPA5p8
Message-ID: <CAO9ioeWaPKXHgNGPx5q34+RP59PMLD+EVK5fQsN89KC9A1ca-Q@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8650: add iris DT node
To: neil.armstrong@linaro.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: rEJVr6N_NHpIzm6PFXtVpOZgTqoQ-yCo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA4OCBTYWx0ZWRfXyaLwKcM9vHBK STmKKuyl+Xbb3bwJuaypJtXFcbmC/20c71q/9tOTkGZw5fEt0iCFrdyW7YxWhMBbYFgEOdxyAZ/ Krn7jK5gxJk/iQIXR5b5W1ZlZqi1N45i0CGeluVCYNf16tShStCA3LiU5pEjlW1b9ualkefpGA6
 cFmVpJdhUfEAURy5TSTrEe0OQtL5Tqkp3pRHp5DQ47MF9QGHcHhsd3fejOTxWimQQ4fdPY9bMiq BLZdz3VIs8smU5polSuRpsG2QKlSUnyr0rQqY7lwRjR1oio1AjhOBAHiCEMIPdDAulHjdsd1R4b uT26t0L1alpVOdzrSYoojJ88+QZEzQvpWSovwrLo43AotfgKCTZB5BZUb/PqDWt9tl6cf7f+LWF
 0pj/7UaH5+A87NYuMTGICDcaf8pzeDzFP4A8M0kuslv0tHSl0Eq5Com3cWO7+ro317EvOPw1
X-Proofpoint-GUID: rEJVr6N_NHpIzm6PFXtVpOZgTqoQ-yCo
X-Authority-Analysis: v=2.4 cv=DKWP4zNb c=1 sm=1 tr=0 ts=680f5cef cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=M_VgH1IvVxprlxKqiToA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280088

On Mon, 28 Apr 2025 at 11:18, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On 25/04/2025 23:49, Konrad Dybcio wrote:
> > On 4/24/25 6:32 PM, Neil Armstrong wrote:
> >> Add DT entries for the sm8650 iris decoder.
> >>
> >> Since the firmware is required to be signed, only enable
> >> on Qualcomm development boards where the firmware is
> >> available.
> >>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >> ---
> >> Changes in v2:
> >> - removed useless firmware-name
> >> - Link to v1: https://lore.kernel.org/r/20250418-topic-sm8x50-upstream-iris-8650-dt-v1-1-80a6ae50bf10@linaro.org
> >> ---
> >
> > [...]
> >
> >> +            iris: video-codec@aa00000 {
> >> +                    compatible = "qcom,sm8650-iris";
> >> +                    reg = <0 0x0aa00000 0 0xf0000>;
> >> +
> >> +                    interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>;
> >> +
> >> +                    power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> >> +                                    <&videocc VIDEO_CC_MVS0_GDSC>,
> >> +                                    <&rpmhpd RPMHPD_MXC>,
> >> +                                    <&rpmhpd RPMHPD_MMCX>;
> >> +                    power-domain-names = "venus",
> >> +                                         "vcodec0",
> >> +                                         "mxc",
> >> +                                         "mmcx";
> >> +
> >> +                    operating-points-v2 = <&iris_opp_table>;
> >> +
> >> +                    clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> >> +                             <&videocc VIDEO_CC_MVS0C_CLK>,
> >> +                             <&videocc VIDEO_CC_MVS0_CLK>;
> >> +                    clock-names = "iface",
> >> +                                  "core",
> >> +                                  "vcodec0_core";
> >> +
> >> +                    interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> >> +                                     &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> >> +                                    <&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
> >> +                                     &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> >> +                    interconnect-names = "cpu-cfg",
> >> +                                         "video-mem";
> >> +
> >> +                    /* FW load region */
> >
> > I don't think this comment brings value
>
> Right
>
> >
> >> +                    memory-region = <&video_mem>;
> >> +
> >> +                    resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
> >> +                             <&videocc VIDEO_CC_XO_CLK_ARES>,
> >> +                             <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
> >> +                    reset-names = "bus",
> >> +                                  "xo",
> >> +                                  "core";
> >> +
> >> +                    iommus = <&apps_smmu 0x1940 0>,
> >> +                             <&apps_smmu 0x1947 0>;
> >
> > I think you may also need 0x1942 0x0 (please also make the second value / SMR
> > mask hex)> +
>
> I don't see 0x1942 in the downstream DT, and which mask should I set ? 0x1 ?
>
> >> +                    dma-coherent;
> >> +
> >> +                    /*
> >> +                     * IRIS firmware is signed by vendors, only
> >> +                     * enable in boards where the proper signed firmware
> >> +                     * is available.
> >> +                     */
> >
> > Here's to another angry media article :(
> >
> > Please keep Iris enabled.. Vikash reassured me this is not an
> > issue until the user attempts to use the decoder [1], and reading
> > the code myself I come to the same conclusion (though I haven't given
> > it a smoke test - please do that yourself, as you seem to have a better
> > set up with these platforms).
> >
> > If the userland is sane, it should throw an error and defer to CPU
> > decoding.
> >
> > This is >>unlike venus<< which if lacking firmware at probe (i.e. boot)
> > would prevent .sync_state
>
> Well sync with Bjorn who asked me to only enable on board with available firmware ;-)

I'd second him here: if there is no firmware, don't enable the device.
It's better than the users having cryptic messages in the dmesg,
trying to understand why the driver errors out.

>
> >
> > [1] https://lore.kernel.org/linux-arm-msm/98a35a51-6351-5ebb-4207-0004e89682eb@quicinc.com/
> >
> > [...]
> >
> >> +
> >> +                            opp-480000000 {
> >> +                                    opp-hz = /bits/ 64 <480000000>;
> >> +                                    required-opps = <&rpmhpd_opp_turbo>,
> >> +                                                    <&rpmhpd_opp_turbo>;
> >
> > nom (nom nom nom nom nom)
> >
> >> +                            };
> >> +
> >> +                            opp-533333334 {
> >> +                                    opp-hz = /bits/ 64 <533333334>;
> >> +                                    required-opps = <&rpmhpd_opp_turbo_l1>,
> >> +                                                    <&rpmhpd_opp_turbo_l1>;
> >
> > turbo
>
> Ack
>
> >
> > Konrad
>
> Thanks,
> Neil



-- 
With best wishes
Dmitry

